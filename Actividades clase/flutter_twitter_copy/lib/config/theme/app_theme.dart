import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue,
    hintColor: Colors.lightBlue,
    appBarTheme: AppBarTheme(
      color: Colors.lightBlue,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 45, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 14, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 10, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 10, color: Colors.black87),
    ),
    dialogBackgroundColor: Colors.lightBlue,
  );
}