import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData.dark(useMaterial3: true).copyWith(
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.black26,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 20,
    ),
  ),
  splashFactory: NoSplash.splashFactory,
  dividerColor: const Color.fromRGBO(70, 70, 70, 0.3),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF07C160),
    onPrimary: Color(0xFF06AD56),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.w900,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  ),
);
