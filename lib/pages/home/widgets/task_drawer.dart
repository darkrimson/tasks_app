import 'package:flutter/material.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Navigation'),
          ),
          ListTile(
            title: const Text('Calendar'),
            onTap: () {
              Navigator.pushNamed(context, '/calendar_page');
            },
          ),
          ListTile(
            title: const Text('Task Tracker'),
            onTap: () {
              Navigator.pushNamed(context, '/task_tracker_page');
            },
          ),
        ],
      ),
    );
  }
}
