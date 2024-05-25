import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {
  static SPUtil? _instance;
  SharedPreferences? _preferences;

  // 工厂构造函数，返回单例实例
  factory SPUtil() {
    return _instance ??= SPUtil._initial();
  }

  // 私有命名构造函数，用于初始化实例
  SPUtil._initial() {
    init();
  }

  // 初始化 SharedPreferences
  void init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  // 静态方法，异步预初始化单例实例
  static Future<SPUtil?> perInit() async {
    if (_instance == null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      _instance = SPUtil._pre(preferences);
    }
    return _instance;
  }

  // 私有命名构造函数，用于初始化 SharedPreferences 实例
  SPUtil._pre(SharedPreferences prefs) {
    _preferences = prefs;
  }

  // 其他方法...
  ///设置String类型的
  void setString(key, value) {
    _preferences?.setString(key, value);
  }

  String? getString(key) {
    return _preferences?.getString(key);
  }

  ///设置setStringList类型的
  void setStringList(key, value) {
    _preferences?.setStringList(key, value);
  }

  List<String> getStringList(key) {
    return _preferences?.getStringList(key) ?? [];
  }

  ///设置setBool类型的
  void setBool(key, value) {
    _preferences?.setBool(key, value);
  }

  bool? getBool(key) {
    return _preferences?.getBool(key);
  }

  ///设置setInt类型的
  void setInt(key, value) {
    _preferences?.setInt(key, value);
  }

  int? getInt(key) {
    return _preferences?.getInt(key);
  }

  ///设置setDouble类型的
  void setDouble(key, value) {
    _preferences?.setDouble(key, value);
  }

  ///存储Json类型的
  void setJson(key, value) {
    value = jsonEncode(value);
    _preferences?.setString(key, value);
  }

  ///获取JSON
  Map<String, dynamic>? getJson(key) {
    String? result = _preferences?.getString(key);
    if (result!.isNotEmpty) {
      return jsonDecode(result);
    }return null;
  }

  ///通过泛型来获取数据
  T? get<T>(key) {
    var result = _preferences?.get(key);
    if (result != null) {
      return result as T;
    }return null;
  }

  ///清除全部
  void clean() {
    _preferences?.clear();
  }

  ///移除某一个
  void remove(key) {
    _preferences?.remove(key);
  }
}
