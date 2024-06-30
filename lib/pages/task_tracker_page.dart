import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/providers/task_provider.dart';

class TaskTrackerPage extends StatelessWidget {
  const TaskTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<TaskProvider>(
              builder: (context, provider, child) {
                final completedTasks = provider.getCompletedTasks();
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Completed Tasks',
                          style: TextStyle(fontSize: 20)),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        final task = completedTasks[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.content),
                          trailing: Checkbox(
                            value: task.isCompleted,
                            onChanged: (bool? value) {
                              task.isCompleted = value!;
                              provider.updateTask(task);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Consumer<TaskProvider>(
              builder: (context, provider, child) {
                final pendingTasks = provider.getPendingTasks();
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('Pending Tasks', style: TextStyle(fontSize: 20)),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pendingTasks.length,
                      itemBuilder: (context, index) {
                        final task = pendingTasks[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.content),
                          trailing: Checkbox(
                            value: task.isCompleted,
                            onChanged: (bool? value) {
                              task.isCompleted = value!;
                              provider.updateTask(task);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
