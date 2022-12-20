import 'package:flutter/material.dart';
import 'package:todo/ui/home/add_task_sheet_widget.dart';
import 'package:todo/ui/home/settings/settings_tab.dart';
import 'package:todo/ui/home/tasks_list/tasks_tab.dart';
import 'package:todo/ui/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo App',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.lightPrimry,
          shape: StadiumBorder(
              side: BorderSide(color: Theme.of(context).accentColor, width: 4)),
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).accentColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
        body: Tabs[selectedIndex],
      ),
    );
  }

  List<Widget> Tabs = [TasksTab(), SettingsTab()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return AddTaskSheet();
        });
  }
}
