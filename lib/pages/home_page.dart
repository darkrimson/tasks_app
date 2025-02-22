import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/pages/widgets/task_drawer.dart';
import 'package:tasks_app/pages/widgets/task_list.dart';
import 'package:tasks_app/providers/color_provider.dart';
import '../providers/task_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDay = DateTime.now();
    final String formattedDate = DateFormat('MMMM d').format(DateTime.now());
    final colorProvider = Provider.of<ColorProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(formattedDate),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Tasks',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Consumer<TaskProvider>(
              builder: (context, provider, child) {
                final tasks = provider.getPendingTasksByDate(selectedDay);
                if (tasks.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'No tasks for this day',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }
                return TaskList(
                  tasks: tasks,
                  onTap: (task) {
                    colorProvider.setSelectedColor(task.color);
                    Navigator.pushNamed(context, '/task_detail',
                        arguments: task);
                  },
                );
              },
            ),
            Consumer<TaskProvider>(
              builder: (context, provider, child) {
                final completedTasks =
                    provider.getCompletedTasksByDate(selectedDay);
                return Column(
                  children: [
                    completedTasks.isNotEmpty
                        ? const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 5.0),
                              child: Text('Completed Tasks',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400)),
                            ),
                          )
                        : Container(),
                    TaskList(
                      tasks: completedTasks,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          colorProvider.clearSelectedColor();
          Navigator.pushNamed(context, '/task_detail');
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: const TaskDrawer(),
    );
  }
}
