import 'package:flutter/material.dart';

class ThemeState {
  final int color;
  final bool darkMode;
  final ThemeData themeData;
  final int colorBackground;
  final int dialogColor;

  const ThemeState({
    this.color = 0,
    this.darkMode = false,
    this.colorBackground = 10,
    required this.themeData,
    required this.dialogColor,
  });

  ThemeState copyWith({
    int? color,
    bool? darkMode,
    int? colorBackground,
    ThemeData? themeData,
    int? dialogColor,
  }) {
    return ThemeState(
      color: color ?? this.color,
      darkMode: darkMode ?? this.darkMode,
      colorBackground: colorBackground ?? this.colorBackground,
      themeData: themeData ?? this.themeData,
      dialogColor: dialogColor ?? this.dialogColor,
    );
  }
}
