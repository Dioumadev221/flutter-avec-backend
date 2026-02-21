import 'package:flutter/material.dart';

 class ThemePerso {
  //Mode clair
  static final ThemeData modeClair = ThemeData(
    //définie automatiquement une palette de couleurs à partir d'une couleur de base (seedColor)
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.light,
      primary: Colors.pink,
      secondary: Colors.deepOrange,
      tertiary: Colors.yellow,
    ),

    //Active les composants de Material Design 3
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
  );

  //Mode sombre
  static final ThemeData modeSombre = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.dark,
      primary: Colors.teal,
      secondary: Colors.amber,
      tertiary: Colors.lime,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.cyan,
      foregroundColor: Colors.black,
    ),
  );
}
