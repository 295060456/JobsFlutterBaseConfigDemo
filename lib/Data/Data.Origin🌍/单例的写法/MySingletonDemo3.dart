import 'dart:developer';
import 'package:flutter/foundation.dart';
// 在 Dart 中，没有内置的方法可以显式销毁一个类的实例，包括单例。
// 这是因为 Dart 像许多现代编程语言一样，依赖垃圾回收来自动管理内存。
// 一旦没有对一个对象的引用，垃圾回收器最终会回收该内存。
class MySingleton {
  // 私有构造函数。只是提醒私有，外部还是可以被调用的。
  MySingleton._();
  // 单例对象
  // 单例对象要被重置为null，要求_instance不能被final修饰，因为不能直接赋值null
  static MySingleton? _instance;
  // 获取单例对象的方法
  static MySingleton get instance {
    _instance ??= MySingleton._();
    return _instance!;
  }
  // 销毁单例对象的方法
  static void destroyInstance() {
    _instance = null;
    debugPrint("该单例对象已经被销毁");
  }

  // 其他方法
  void doSomething() {
    log("Singleton is doing something.");
  }
}

void main() {
  // 获取单例实例
  MySingleton singleton = MySingleton.instance;
  singleton.doSomething();
  // 销毁单例实例
  MySingleton.destroyInstance();
  // 获取新的单例实例
  MySingleton newSingleton = MySingleton.instance;
  newSingleton.doSomething();
}
