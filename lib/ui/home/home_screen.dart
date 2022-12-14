import 'package:flutter/material.dart';
import 'package:todo/ui/home/add_task_widget.dart';
import 'package:todo/ui/home/settings/settings_tab.dart';
import 'package:todo/ui/home/tasks_list/tasks_tab.dart';

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
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
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
          return AddTask();
        });
  }
}
