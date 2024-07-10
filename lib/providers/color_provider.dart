import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';

class ColorProvider extends ChangeNotifier {
  late Color _selectedColor = Colors.white;
  Color get selectedColor => _selectedColor;

  void setSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void clearSelectedColor() {
    _selectedColor = Colors.white;
    notifyListeners();
  }
}
