import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/database/task.dart';
import 'package:todo/ui/my_theme.dart';
import 'package:todo/utils_package/date_utils.dart';
import 'package:todo/utils_package/dialog_utils.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskSheet> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline4?.copyWith(fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              style: TextStyle(
                  color: MyTheme.lightPrimry,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Please Enter a vailed Title';
                }
              },
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.title,
                    style: Theme.of(context).textTheme.headline5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: descriptionController,
              style: TextStyle(
                  color: MyTheme.lightPrimry,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
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
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)!.select_date,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                showTaskDatePicker();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(MyDateUtils.formatTaskDate(selectedDate),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 44,
              child: ElevatedButton(
                  onPressed: () {
                    insertTask();
                  },
                  child: Text('submit',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }

  void insertTask() async {
    if (formKey.currentState?.validate() == false) {}
    Task task = Task(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate);
    DialogUtils.showProgressDialog(context, 'loading', isDismissible: false);
    await MyDatabase.insertTask(task);
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context, 'Task inserted sucessfully ',
        posActionTitle: 'OK', negActionTitle: 'Cancel', posAction: () {
      Navigator.pop(context);
    }, negAction: () {
      Navigator.pop(context);
    });
  }

  var selectedDate = DateTime.now();

  Future<void> showTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (userSelectedDate == null) {
      return;
    }
    selectedDate = userSelectedDate;
    setState(() {});
  }
}
