import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// app偏好存储
class AppPreferenceCache {
  static AppPreferenceCache? _instance;
  static Completer<AppPreferenceCache>? _completer;

  final SharedPreferences _pres;
  AppPreferenceCache._(this._pres);

  static Future<AppPreferenceCache> getInstance() async {
    if (_instance != null) {
      return _instance!;
    }
    if (_completer == null) {
      final Completer<AppPreferenceCache> completer =
          Completer<AppPreferenceCache>();
      _completer = completer;
      try {
        final pres = await SharedPreferences.getInstance();
        completer.complete(AppPreferenceCache._(pres));
      } catch (e) {
        completer.completeError(e);
        final sharedPreferenceFuture = completer.future;
        _completer = null;
        return sharedPreferenceFuture;
      }
    }
    _instance = await _completer!.future;
    return _instance!;
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
