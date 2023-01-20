import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/ui/home/edit_task_screen.dart';
import 'package:todo/ui/my_theme.dart';
import 'package:todo/utils_package/dialog_utils.dart';

import '../../../database/task.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem({required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.red,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .2,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (buildContext) {
                deleteTask();
              },
              backgroundColor: Colors.red,
              label: 'delete',
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, EditTaskScreen.routeName,
                arguments: widget.task);
          },
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: widget.task.isDone == false
                          ? MyTheme.lightPrimry
                          : MyTheme.greenColor),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.task.title,
                          style: widget.task.isDone == false
                              ? Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: MyTheme.lightPrimry)
                              : Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: MyTheme.greenColor)),
                      SizedBox(height: 12),
                      Text(
                        widget.task.description,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    doneTask();
                    setState(() {});
                  },
                  child: widget.task.isDone
                      ? Text(
                          AppLocalizations.of(context)!.done,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: MyTheme.greenColor, fontSize: 23),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: MyTheme.lightPrimry,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    DialogUtils.showMessage(
        context, 'Are you sure you want to delete this task ?',
        posActionTitle: 'yes', posAction: () async {
      DialogUtils.showProgressDialog(context, 'Loading...');
      await MyDatabase.deleteTask(widget.task);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'Task deleted successfully',
          posActionTitle: 'Ok', negActionTitle: 'Undo', negAction: () {
        //Todo undo delete
      });
    }, negActionTitle: 'Cancel');
  }

  void doneTask() {
    MyDatabase.markAsDone(widget.task);
  }
}
