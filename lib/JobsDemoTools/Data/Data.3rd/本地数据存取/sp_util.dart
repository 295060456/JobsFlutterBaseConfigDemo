import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_json_serializable.dart';

/// SharedPreferences 工具类（融合初始化+存取+Bean序列化）
/// Flutter.SharedPreferences == OC.NSUserDefaults == Swift.UserDefaults
class SpUtil {
  static late SharedPreferences _prefs;

  /// 初始化（程序启动时调用一次）
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ------------------- 基础类型 -------------------

  static Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);
  static String? getString(String key) => _prefs.getString(key);

  static Future<bool> setInt(String key, int value) =>
      _prefs.setInt(key, value);
  static int? getInt(String key) => _prefs.getInt(key);

  static Future<bool> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);
  static double? getDouble(String key) => _prefs.getDouble(key);

  static Future<bool> setBool(String key, bool value) =>
      _prefs.setBool(key, value);
  static bool? getBool(String key) => _prefs.getBool(key);

  static Future<bool> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);
  static List<String>? getStringList(String key) => _prefs.getStringList(key);

  // ------------------- Bean 类型（带泛型） -------------------

  static Future<bool> setBean<T extends AppJsonSerializable>(
      String key, T value) {
    String jsonStr = jsonEncode(value.toJson());
    return _prefs.setString(key, jsonStr);
  }

  static T? getBean<T extends AppJsonSerializable>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    String? jsonStr = _prefs.getString(key);
    if (jsonStr == null) return null;
    return fromJson(jsonDecode(jsonStr));
  }

  // ------------------- 清理操作 -------------------

  static Future<bool> remove(String key) => _prefs.remove(key);
  static Future<bool> clear() => _prefs.clear();
}
