import 'package:flutter/src/material/theme_data.dart';



import 'package:flutter/material.dart';

class ThemeState {
  final int color;
  final bool darkMode;
  final ThemeData themeData;

  const ThemeState({
    this.color = 0,
    this.darkMode = false,
    required this.themeData,
  });

  ThemeState copyWith({
    int? color,
    bool? darkMode,
    ThemeData? themeData,
  }) {
    return ThemeState(
      color: color ?? this.color,
      darkMode: darkMode ?? this.darkMode,
      themeData: themeData ?? this.themeData,
    );
  }
}