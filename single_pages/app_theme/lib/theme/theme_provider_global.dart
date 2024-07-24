import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ThemeProviderGlobal {
  static late SharedPreferences pres;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    pres = await SharedPreferences.getInstance();
  }
}
