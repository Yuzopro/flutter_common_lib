import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  factory SpUtil() => _getInstance();

  static SpUtil get instance => _getInstance();
  static SpUtil _instance;

  SpUtil._internal();

  static SharedPreferences _prefs;

  static SpUtil _getInstance() {
    if (_instance == null) {
      _instance = new SpUtil._internal();
    }
    return _instance;
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  putInt(String key, int value) {
    if (checkNull()) {
      return null;
    }
    _prefs.setInt(key, value);
  }

  int getInt(String key, {int defValue = 0}) {
    if (checkNull()) {
      return defValue;
    }
    return _prefs.getInt(key) ?? defValue;
  }

  putString(String key, String value) {
    if (checkNull()) {
      return null;
    }
    _prefs.setString(key, value);
  }

  String getString(String key, {String defValue = ''}) {
    if (checkNull()) {
      return defValue;
    }
    return _prefs.getString(key) ?? defValue;
  }

  putObject(String key, Object value) {
    if (checkNull()) {
      return null;
    }
    return _prefs.setString(key, value == null ? "" : json.encode(value));
  }

  Map getObject(String key) {
    if (checkNull()) {
      return null;
    }
    String _data = _prefs.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  bool checkNull() {
    return _prefs == null;
  }
}
