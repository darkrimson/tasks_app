import 'package:flutter/material.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Icon(
              Icons.task_alt_sharp,
              size: 100,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            tileColor: Colors.grey.shade200,
            title: const Text(
              'Calendar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/calendar_page');
            },
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: const Icon(Icons.graphic_eq),
            tileColor: Colors.grey.shade200,
            title: const Text(
              'Task Tracker',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/task_tracker_page');
            },
          ),
        ],
      ),
    );
  }
}
