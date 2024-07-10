import 'package:flutter/material.dart';

class TextFieldProvider extends ChangeNotifier {
  String _title = '';
  String get title => _title;

  String _content = '';
  String get content => _content;

  void setTitle(String text) {
    _title = text;
    notifyListeners();
  }

  void setContent(String text) {
    _content = text;
    notifyListeners();
  }

  void clearTextFields() {
    _title = '';
    _content = '';
    notifyListeners();
  }
}
