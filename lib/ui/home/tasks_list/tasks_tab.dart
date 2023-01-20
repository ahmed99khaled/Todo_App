import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/ui/home/tasks_list/task_item.dart';
import 'package:todo/ui/my_theme.dart';

import '../../../database/task.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  List<Task> allTasks = [];
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (allTasks.isEmpty) {
      loadTasks();
    }

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            leftMargin: 20,
            monthColor: Theme.of(context).primaryColorLight,
            dayColor: Theme.of(context).primaryColorLight,
            activeDayColor: MyTheme.lightPrimry,
            activeBackgroundDayColor: Colors.white,
            dotsColor: MyTheme.lightPrimry,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
              child:
                  //allTasks.isEmpty? Center(child: CircularProgressIndicator()):
                  StreamBuilder(
                    stream: MyDatabase.getTaskRealTimeUpdates(selectedDate),
            builder: (buildContext, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapShot.hasError) {
                return Center(child: Text('Something went wrong'));
              }
              var tasks = snapShot.data?.docs.map((doc) => doc.data()).toList();
              return ListView.builder(
                itemBuilder: (context, index) => TaskItem(task: tasks![index]),
                itemCount: tasks?.length ?? 0,
              );
            },
          )
              //     FutureBuilder<List<Task>>(
              //         future: MyDatabase.getTasks(),
              //         builder:(buildContext,snapShot){
              //           if(snapShot.connectionState == ConnectionState.waiting){
              //             return Center(child:CircularProgressIndicator(),);
              //           }
              //           if(snapShot.hasError){
              //             return Center(child: Text('Something went wrong'));
              //           }
              //           var tasks=snapShot.data;
              //           return ListView.builder(
              //               itemBuilder:(context, index) =>TaskItem(task: tasks![index]),
              //             itemCount:tasks?.length ??0,
              //           );
              //         } ,
              //     )
              ),
        ],
      ),
    );
  }

  // Function doesn't use
  void loadTasks() async {
    allTasks = await MyDatabase.getTasks(selectedDate);
    setState(() {});
  }
}
