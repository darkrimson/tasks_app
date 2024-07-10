import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/pages/widgets/set_color_widget.dart';
import 'package:tasks_app/providers/color_provider.dart';
import 'package:tasks_app/providers/task_provider.dart';
import 'package:tasks_app/providers/text_field_provider.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    final textFieldProvider =
        Provider.of<TextFieldProvider>(context, listen: false);
    final colorProvider = Provider.of<ColorProvider>(context, listen: false);

    final Task? task = ModalRoute.of(context)?.settings.arguments as Task?;
    final titleController =
        TextEditingController(text: task?.title ?? textFieldProvider.title);
    final contentController =
        TextEditingController(text: task?.content ?? textFieldProvider.content);

    if (task?.color == null) {
      colorProvider
          .setSelectedColor(task?.color ?? colorProvider.selectedColor);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
        actions: [
          if (task != null)
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                provider.deleteTask(task);
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => textFieldProvider.setTitle(value),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                onChanged: (value) => textFieldProvider.setContent(value),
                maxLines: 10,
              ),
              const SizedBox(height: 16.0),
              const SetColorWidget(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text;
                  final content = contentController.text;

                  if (title.isEmpty || content.isEmpty) {
                    return;
                  }

                  if (task == null) {
                    final newTask = Task(
                      title: title,
                      content: content,
                      date: DateTime.now(),
                      colorHex: colorProvider.selectedColor.toHex(),
                    );
                    textFieldProvider.clearTextFields();
                    provider.addTask(newTask);
                  } else {
                    task.title = title;
                    task.content = content;
                    task.colorHex = colorProvider.selectedColor.toHex();
                    provider.updateTask(task);
                  }

                  Navigator.pop(context);
                },
                child: Text(task == null ? 'Add Task' : 'Save Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension ColorExtension on Color {
  String toHex() => '#${value.toRadixString(16).padLeft(8, '0').substring(2)}';
}
