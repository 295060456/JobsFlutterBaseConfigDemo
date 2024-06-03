
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_info.dart';

class Storage {
  // 私有构造函数。只是提醒私有，外部还是可以被调用的。
  Storage._();
  // 单例对象
  // 单例对象要被重置为null，要求_instance不能被final修饰，因为不能直接赋值null
  static Storage? _instance;
  // 获取单例对象的方法
  static Storage get instance {
    _instance ??= Storage._();
    return _instance!;
  }
  // 销毁单例对象的方法
  static void destroyInstance() {
    _instance = null;
    debugPrint("该单例对象已经被销毁");
  }
  // UserInfo 字段
  UserInfo? _userInfo;
  UserInfo get userInfo {
    _userInfo ??= UserInfo();
    return _userInfo!;
  }
  set userInfo(UserInfo? value) {
    _userInfo = value;
  }

  // String 字段
  String? _key;
  String? get key {
    _key ??= "";
    return _key!;
  }
  set key(String? value) {
    _key = value;
  }
  // DateTime 字段
  DateTime? _dateTime;
  DateTime? get dateTime {
    _dateTime ??= DateTime.now();
    return _dateTime;
  }
  set dateTime(DateTime? value) {
    _dateTime = value;
  }
  // double 字段
  double? _doubleValue;
  double get doubleValue {
    _doubleValue ??= 0.0;
    return _doubleValue!;
  }
  set doubleValue(double? value) {
    _doubleValue = value;
  }
  // int 字段
  int? _intValue;
  int get intValue {
    _intValue ??= 0;
    return _intValue!;
  }
  set intValue(int? value) {
    _intValue = value;
  }
  // bool 字段
  bool? _boolValue;
  bool get boolValue {
    _boolValue ??= false;
    return _boolValue!;
  }
  set boolValue(bool? value) {
    _boolValue = value;
  }
}
// 本地数据存取类
class StorageHelper {
  // 保存方法
  static Future<void>save(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }else if (value is UserInfo) {
      await prefs.setString('userInfo', jsonEncode(value.toJson()));
    }
  }
  // 删除方法
  static Future<void>delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
  // 读取方法
  static Future<UserInfo>loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('userInfo');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return UserInfo.fromJson(jsonMap);
    }return UserInfo();
  }
}

// UserInfo 的存取扩展
extension UserInfoStorage on UserInfo {
  Future<void> save(String key) async {
    await StorageHelper.save(key, toString());
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}

// DateTime 的存取扩展
extension DateTimeStorage on DateTime {
  Future<void> save(String key) async {
    await StorageHelper.save(key, this);
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}
// String 的存取扩展
extension StringStorage on String {
  Future<void> save(String key) async {
    await StorageHelper.save(key, this);
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}
// double 的存取扩展
extension DoubleStorage on double {
  Future<void> save(String key) async {
    await StorageHelper.save(key, this);
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}
// int 的存取扩展
extension IntStorage on int {
  Future<void> save(String key) async {
    await StorageHelper.save(key, this);
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}
// bool 的存取扩展
extension BoolStorage on bool {
  Future<void> save(String key) async {
    await StorageHelper.save(key, this);
  }

  Future<void> delete(String key) async {
    await StorageHelper.delete(key);
  }
}
