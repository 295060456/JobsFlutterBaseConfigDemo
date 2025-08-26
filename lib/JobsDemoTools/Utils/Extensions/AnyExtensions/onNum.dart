import 'package:flutter/material.dart';

extension JobsNumExtension on num {
  /// 转换为 BorderRadiusGeometry
  BorderRadiusGeometry get br => BorderRadius.circular(toDouble());

  /// 转换为字符串
  String get str => toString();

  /// 把 double 变成 Radius
  Radius get radius => Radius.circular(toDouble());
}
