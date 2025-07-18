import 'dart:convert';
import 'package:flutter/foundation.dart';

class UserInfo {
  String name;
  int age;

  // 私有构造函数
  UserInfo._privateConstructor() : name = '', age = 0;
  // 单例实例
  static UserInfo? _instance;
  // 工厂构造函数，返回单例实例
  factory UserInfo() {
    _instance ??= UserInfo._privateConstructor();
    return _instance!;
  }
  // 销毁单例对象的方法
  static void destroyInstance() {
    _instance = null;
    debugPrint("该单例对象已经被销毁");
  }
  // 设置用户信息的方法
  void setUserInfo({required String name, required int age}) {
    this.name = name;
    this.age = age;
  }
  // 将用户信息转换为 JSON 格式
  @override
  String toString() {
    return jsonEncode({'name': name, 'age': age});
  }
  // 从 JSON 格式解析用户信息
  static UserInfo? fromString(String userInfoString) {
    if (userInfoString.isEmpty) {
      return _instance;
    }

    try {
      final Map<String, dynamic> userInfoMap = jsonDecode(userInfoString);
      _instance ??= UserInfo._privateConstructor();
      _instance?.name = userInfoMap['name'];
      _instance?.age = userInfoMap['age'];
    } catch (e) {
      debugPrint('Error decoding userInfoString: $e');
    }return _instance;
  }
  // 将用户信息转换为 JSON 格式
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
  // 从 JSON 格式解析用户信息
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    _instance ??= UserInfo._privateConstructor();
    _instance?.name = json['name'];
    _instance?.age = json['age'];
    return _instance!;
  }
}
