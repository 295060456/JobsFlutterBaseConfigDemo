import 'dart:math';


///旋转常量
///联盟计划-推广教程- 的流程组件 及其 枚举常量
enum ProcessRotate {
  rotate_0(value: pi * 0),
  rotate_90(value: pi / 2),
  rotate_180(value: pi * 1),
  rotate_270(value: pi * 1.5),
  rotate_360(value: pi * 2);

  final double value;

  const ProcessRotate({required this.value});
}

class GlobalState {
  // 私有构造函数。只是提醒私有，外部还是可以被调用的。
  GlobalState._();
  // 单例对象
  // 不仅能保证 _instance 是唯一的，还能确保在其声明时就被初始化
  static final GlobalState _instance = GlobalState._();
  // 获取单例对象的方法
  static GlobalState get instance => _instance;
  bool myGlobalVariable = true;
}