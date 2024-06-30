import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/pages/task_detail_page.dart';
import 'package:tasks_app/themes/light_theme.dart';

import 'models/task.dart';
import 'pages/calendar_page.dart';
import 'pages/home/home_page.dart';
import 'pages/task_tracker_page.dart';
import 'providers/task_provider.dart';
import 'themes/dark_mode.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');

  runApp(const TasksApp());
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tasks App',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: ThemeMode.system,
          initialRoute: '/home_page',
          routes: {
            '/home_page': (context) => const HomePage(),
            '/task_detail': (context) => const TaskDetailPage(),
            '/calendar_page': (context) => const CalendarPage(),
            '/task_tracker_page': (context) => const TaskTrackerPage(),
          }),
    );
  }
}
