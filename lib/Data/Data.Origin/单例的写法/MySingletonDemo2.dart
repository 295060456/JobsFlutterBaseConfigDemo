import 'package:flutter/foundation.dart';

class Singleton {
  // 私有构造函数
  Singleton._internal();

  // 静态私有实例
  static final Singleton _instance = Singleton._internal();

  // 工厂构造函数
  factory Singleton() {
    return _instance;
  }

  // 你的业务逻辑方法
  void someMethod() {
    debugPrint("这是一个单例方法");
  }
}

void main() {
  // 获取单例实例
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  // 验证两个实例是同一个对象
  debugPrint(singleton1 as String?);  
  debugPrint(singleton2 as String?);  
}
