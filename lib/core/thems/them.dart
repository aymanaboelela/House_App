import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    backgroundColor: Colors.grey.shade400,
    primaryColor: Colors.grey.shade300,
    secondaryHeaderColor: Colors.grey.shade200);
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    backgroundColor: Colors.grey.shade900,
    primaryColor: Colors.grey.shade800,
    secondaryHeaderColor: Colors.grey.shade700);
