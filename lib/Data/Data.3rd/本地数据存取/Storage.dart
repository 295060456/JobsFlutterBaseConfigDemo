import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_info.dart';

extension UserInfoStorage on UserInfo {
  // 从 SharedPreferences 加载用户信息
  static Future<UserInfo> loadFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoString = prefs.getString('userInfo');
    if (userInfoString != null) {
      Map<String, dynamic> userInfoJson = json.decode(userInfoString);
      return UserInfo.fromJson(userInfoJson);
    }
    return UserInfo();
  }

  // 将用户信息保存到 SharedPreferences
  Future<void> saveToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfoString = json.encode(toJson());
    await prefs.setString('userInfo', userInfoString);
  }
}

extension DateTimeStorage on DateTime {
  Future<void> save(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, toIso8601String());
  }

  static Future<DateTime?> load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dateString = prefs.getString(key);
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }
}

extension StringStorage on String {
  Future<void> save(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, this);
  }

  static Future<String?> load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

extension DoubleStorage on double {
  Future<void> save(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, toString());
  }

  static Future<double?> load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? doubleString = prefs.getString(key);
    if (doubleString != null) {
      return double.parse(doubleString);
    }
    return null;
  }
}

extension IntStorage on int {
  Future<void> save(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, toString());
  }

  static Future<int?> load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? intString = prefs.getString(key);
    if (intString != null) {
      return int.parse(intString);
    }
    return null;
  }
}

extension BoolStorage on bool {
  Future<void> save(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, toString());
  }

  static Future<bool?> load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? boolString = prefs.getString(key);
    if (boolString != null) {
      return boolString == 'true';
    }
    return null;
  }
}
