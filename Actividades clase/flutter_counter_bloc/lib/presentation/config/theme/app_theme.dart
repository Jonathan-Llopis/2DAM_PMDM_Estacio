import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,

];

class AppTheme {
  ThemeData getTheme(int selectedColor, bool isDarkmode) {
    return ThemeData(
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      primaryColor: colorList[selectedColor],
      hintColor: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        color: colorList[selectedColor],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 45, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}