import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'Edit Task Screen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit Task',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: titleController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please Enter a vailed Title';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'This is Title',
                      style: Theme.of(context).textTheme.headline5,
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
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please Enter a vailed description';
                    }
                  },
                  maxLines: 4,
                  minLines: 4,
                  decoration: InputDecoration(
                    label: Text(
                      'This is description',
                      style: Theme.of(context).textTheme.headline5,
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
                  'Select Date',
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
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Save Changes',
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

  var selectedDate = DateTime.now();

  Future<void> showEditTaskDatePicker() async {
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
