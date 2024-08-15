import 'package:shared_preferences/shared_preferences.dart';

/// app偏好存储
class AppPreferenceCache {
  static late SharedPreferences _pres;
  static Future init() async {
    _pres = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) => _pres.getBool(key);
  Future<bool> setBool(String key, bool value) => _pres.setBool(key, value);

  int? getInt(String key) => _pres.getInt(key);
  Future<bool> setInt(String key, int value) => _pres.setInt(key, value);

  double? getDouble(String key) => _pres.getDouble(key);
  Future<bool> setDouble(String key, double value) =>
      _pres.setDouble(key, value);

  String? getString(String key) => _pres.getString(key);
  Future<bool> setString(String key, String value) =>
      _pres.setString(key, value);
}
