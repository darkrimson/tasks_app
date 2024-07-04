import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey.shade800,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade800,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade800,
    secondary: Colors.black,
    surface: Colors.grey.shade700,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    inversePrimary: Colors.grey.shade300,
  ),
  listTileTheme: const ListTileThemeData(
    leadingAndTrailingTextStyle: TextStyle(color: Colors.black),
    iconColor: Colors.black,
    textColor: Colors.black,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(Colors.black),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: const BorderSide(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      foregroundColor: WidgetStateProperty.all(Colors.black),
    ),
  ),
);
