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
