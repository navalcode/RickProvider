import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getLightTheme() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: const Color(0xFF0054EF),
    brightness: Brightness.light
  );

  ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF0054EF),
    brightness: Brightness.dark
  );

}