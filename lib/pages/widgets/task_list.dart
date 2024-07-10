import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../providers/task_provider.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task task)? onTap;

  const TaskList({
    super.key,
    required this.tasks,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final id = index + 1;
        return Container(
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: task.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    provider.deleteTask(task);
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: ListTile(
              leading: Text(
                id.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              title: Text(
                task.title,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  overflow: TextOverflow.ellipsis,
                  height: 1.2,
                ),
              ),
              subtitle: Text(
                task.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (bool? value) {
                  task.isCompleted = value!;
                  provider.updateTask(task);
                },
              ),
              onTap: () {
                if (onTap != null) {
                  onTap!(task);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
