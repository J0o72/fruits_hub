// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingleton {
  SharedPrefSingleton._();

  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// Removes a value from shared Preferences with given key
  static void removeData(String key) {
    debugPrint('Shared Preferences :  data with key: $key has been removed');

    _instance.remove(key);
  }

  /// Removes all Keys & values from Shared Preferences
  static void removeAllData() {
    debugPrint('Shared Preferences : all data has been cleared');

    _instance.clear();
  }

  /// Save a [value] with a [key] in Shared Preferences
  static void setData(String key, value) {
    debugPrint(
      'Shared Preferences : Set data with key : $key & value : $value',
    );

    switch (value.runtimeType) {
      case String:
        _instance.setString(key, value);
        break;
      case int:
        _instance.setInt(key, value);
        break;
      case bool:
        _instance.setBool(key, value);
        break;
      case double:
        _instance.setDouble(key, value);
        break;
      default:
        return;
    }
  }

  /// Gets a bool value from Shared Preferences with given [key]
  static bool? getBool(String key) {
    debugPrint('Shared Preferences : return bool value with key : $key');

    return _instance.getBool(key) ?? false;
  }

  /// Gets a String value from Shared Preferences with given [key]

  static String? getString(String key) {
    debugPrint('Shared Preferences : return String value with key : $key');

    return _instance.getString(key) ?? '';
  }

  /// Gets a Int value from Shared Preferences with given [key]

  static int? getInt(String key) {
    debugPrint('Shared Preferences : return int value with key : $key');

    return _instance.getInt(key) ?? 0;
  }

  /// Gets a Double value from Shared Preferences with given [key]

  static double? getDouble(String key) {
    debugPrint('Shared Preferences : return double value with key : $key');

    return _instance.getDouble(key) ?? 0.0;
  }
}
