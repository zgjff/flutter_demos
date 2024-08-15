import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.black26,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.dark(
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
