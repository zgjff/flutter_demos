import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF07C160),
    onPrimary: Color(0xFF06AD56),
    surface: Colors.black87,
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
