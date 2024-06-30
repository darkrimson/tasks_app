import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/task_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDay = DateTime.now();
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks $formattedDate'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<TaskProvider>(
              builder: (context, provider, child) {
                final tasks = provider.getPendingTasksByDate(selectedDay);
                if (tasks.isEmpty) {
                  return const Center(
                    child: Text('No tasks for this day'),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    final id = index + 1;
                    if (!task.isCompleted) {
                      return ListTile(
                        leading: Text(
                          id.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        title: Text(task.title),
                        subtitle: Text(task.content),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (bool? value) {
                            task.isCompleted = value!;
                            provider.updateTask(task);
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/task_detail',
                              arguments: task);
                        },
                      );
                    }
                    return null;
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
                        ? const Text('Completed Tasks',
                            style: TextStyle(fontSize: 20))
                        : const Divider(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        final task = completedTasks[index];
                        final id = index + 1;
                        if (task.isCompleted) {
                          return ListTile(
                            leading: Text(
                              id.toString(),
                              style: const TextStyle(fontSize: 25),
                            ),
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
                        }
                        return null;
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/task_detail'),
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
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
      ),
    );
  }
}
