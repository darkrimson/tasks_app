import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey.shade500,
  scaffoldBackgroundColor: Colors.grey.shade200,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.grey.shade500,
    surface: Colors.grey.shade500,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    inversePrimary: Colors.grey.shade400,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.black),
      foregroundColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white, // Фон для Drawer белый
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.black, // Текст в Drawer черный
  ),
);
