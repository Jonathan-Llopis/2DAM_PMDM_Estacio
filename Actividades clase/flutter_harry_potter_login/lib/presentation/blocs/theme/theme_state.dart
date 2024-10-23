import 'package:flutter/material.dart';

class ThemeState {
  final int color;
  final bool darkMode;
  final ThemeData themeData;
  final int dialogColor;
  final String font;

  const ThemeState({
    this.color = 0,
    this.darkMode = false,
    required this.themeData,
    required this.dialogColor,
    required this.font,
  });

  ThemeState copyWith({
    int? color,
    bool? darkMode,
    ThemeData? themeData,
    int? dialogColor,
    String? font,
  }) {
    return ThemeState(
      color: color ?? this.color,
      darkMode: darkMode ?? this.darkMode,
      themeData: themeData ?? this.themeData,
      dialogColor: dialogColor ?? this.dialogColor,
      font: font ?? this.font,
    );
  }
}
