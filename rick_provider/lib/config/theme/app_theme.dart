
import 'package:flutter/material.dart';

class AppTheme {
//TODO: create methods getLightTheme and getDarkTheme returning ThemeData
  ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.blue
  );

  ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.purple
  );
}