import 'package:app_theme/theme/index.dart';
import 'package:flutter/material.dart';

import 'dart_theme.dart';
import 'light_theme.dart';

final class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    final saveMode = ThemeProviderGlobal.pres.getInt(_themeKey);
    if (saveMode == null) {
      _themeMode = ThemeMode.system;
      return;
    }
    _themeMode = (saveMode == 1)
        ? ThemeMode.light
        : (saveMode == 2)
            ? ThemeMode.dark
            : ThemeMode.system;
  }

  final String _themeKey = 'theme_mode';
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  ThemeData lightTheme() {
    return lightMode;
  }

  ThemeData darkTheme() {
    return darkMode;
  }

  Future<bool> changeTheme(ThemeMode mode) async {
    if (mode == _themeMode) {
      return Future(() => false);
    }
    _themeMode = mode;
    final value = (mode == ThemeMode.light)
        ? 1
        : (mode == ThemeMode.dark)
            ? 2
            : 0;
    final result = await ThemeProviderGlobal.pres.setInt(_themeKey, value);
    notifyListeners();
    return result;
  }
}
