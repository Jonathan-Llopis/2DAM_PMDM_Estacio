import 'package:flutter/material.dart';



class AppTheme {
  static const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Colors.grey,
  Colors.white,
  Colors.black,

];
  ThemeData getTheme(int selectedColor, bool isDarkmode, int colorBackground, int dialogColor) {
    return ThemeData(
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      primaryColor: colorList[1],
      hintColor: colorList[selectedColor],
      scaffoldBackgroundColor: colorList [colorBackground],
      appBarTheme: AppBarTheme(
        color: colorList[selectedColor],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 45, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
      ),
      dialogBackgroundColor: colorList[dialogColor],
    );
  }
}