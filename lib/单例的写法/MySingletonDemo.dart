import 'dart:developer';

// 使用示例
void main() {
  // 获取单例对象
  MySingleton singleton = MySingleton.instance;
  // 使用单例对象的方法
  singleton.doSomething();
}

class MySingleton {
  // 私有构造函数。只是提醒私有，外部还是可以被调用的。
  MySingleton._();
  // 单例对象
  // 不仅能保证 _instance 是唯一的，还能确保在其声明时就被初始化
  static final MySingleton _instance = MySingleton._();
  // 获取单例对象的方法
  static MySingleton get instance => _instance;
  // 其他方法或属性
  void doSomething() {
    log("Singleton is doing something.");
  }
}
