import 'package:flutter/material.dart';

import 'dart_theme.dart';
import 'light_theme.dart';

final class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  ThemeData get lightTheme => lightMode;
  ThemeData get darkTheme => darkMode;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = isDarkMode ? lightMode : darkMode;
  }
}
