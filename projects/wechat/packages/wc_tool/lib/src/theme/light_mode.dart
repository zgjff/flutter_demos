import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData.light(useMaterial3: true).copyWith(
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    // backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  dividerColor: const Color.fromRGBO(77, 77, 77, 0.1),
  colorScheme: const ColorScheme.light(
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
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w900,
    ),
  ),
);
