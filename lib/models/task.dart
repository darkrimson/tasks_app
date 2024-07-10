import 'package:flutter/material.dart';
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

  @HiveField(4)
  String colorHex;

  Task({
    required this.title,
    required this.content,
    required this.date,
    this.isCompleted = false,
    this.colorHex = '#FFFFFF',
  });

  Color get color => _colorFromHex(colorHex);
  set color(Color color) => colorHex = _colorToHex(color);

  Color _colorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}
