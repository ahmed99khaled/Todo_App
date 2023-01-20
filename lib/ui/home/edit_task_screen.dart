import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/ui/my_theme.dart';
import 'package:todo/utils_package/date_utils.dart';

import '../../database/task.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'Edit Task Screen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Task? task;

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)?.settings.arguments as Task;
    titleController = TextEditingController(text: task!.title);
    descriptionController = TextEditingController(text: task!.description);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
          margin: EdgeInsets.only(
            top: 30,
            right: 20,
            left: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Text(
                  AppLocalizations.of(context)!.edit_task,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: titleController,
                  style: TextStyle(
                      color: MyTheme.lightPrimry,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    task!.title = value;
                  },
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please Enter a vailed Title';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontSize: 16),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: descriptionController,
                  style: TextStyle(
                      color: MyTheme.lightPrimry,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    task!.description = value;
                  },
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please Enter a vailed description';
                    }
                  },
                  maxLines: 4,
                  minLines: 4,
                  decoration: InputDecoration(
                    label: Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontSize: 16),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  AppLocalizations.of(context)!.select_date,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    showEditTaskDatePicker();
                  },
                  child: Text(
                    //'${task!.dateTime.day}/ ${task!.dateTime.month}/ ${task!.dateTime.year}',
                    MyDateUtils.formatTaskDate(task!.dateTime),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: MyTheme.lightPrimry),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      editTask();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        AppLocalizations.of(context)!.save_changes,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                            ),
                      ),
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

  void editTask() {
    MyDatabase.updateTask(task!);
    Navigator.pop(context);
  }

  var selectedDate = DateTime.now();

  showEditTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: task!.dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (userSelectedDate == null) {
      return;
    }
    task!.dateTime = userSelectedDate;
    setState(() {});
  }
}
