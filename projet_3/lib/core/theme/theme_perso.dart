 import 'package:flutter/material.dart';
class ThemePerso {
  static final ThemeData modeClair = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red,
        brightness: Brightness.light,
        primary: Colors.pink,
        secondary: Colors.deepOrangeAccent,
        tertiary: Colors.yellow,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      )
  );

  static final ThemeData modeSombre=ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red,
      brightness: Brightness.dark,
      primary: Colors.teal,
      secondary: Colors.amber,
      tertiary: Colors.lime,
    ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,

      ),
  );
}