import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextFormField(
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                label: Text('description'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Select Date',
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
                child: Text(
                  '12/12/2022',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('submit'))
          ],
        ),
      ),
    );
  }

  void showTaskDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
