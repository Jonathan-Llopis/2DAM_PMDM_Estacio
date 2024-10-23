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
  ThemeData getTheme(int selectedColor, bool isDarkmode, int dialogColor, String font) {
    return ThemeData(
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      primaryColor: colorList[1],
      hintColor: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        color: colorList[selectedColor],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 45, color: Colors.black),
        bodyLarge: TextStyle(fontSize:20, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 16, color:Colors.black87),
        bodySmall: TextStyle(fontSize: 13, color:Colors.black87),
      ),
      dialogBackgroundColor: colorList[dialogColor],
      fontFamily: font,
    );
  }
}