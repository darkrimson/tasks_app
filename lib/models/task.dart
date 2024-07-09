import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool isCompleted = false;

  Task({
    required this.title,
    required this.content,
    required this.date,
    this.isCompleted = false,
  });
}
