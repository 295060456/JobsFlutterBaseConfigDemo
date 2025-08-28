import 'dart:math';
import 'package:flutter/material.dart';

extension JobsNumX on num {
  /// 转换为 BorderRadiusGeometry
  BorderRadiusGeometry get br => BorderRadius.circular(toDouble());

  /// 转换为字符串
  String get str => toString();

  /// 把 double 变成 Radius
  Radius get radius => Radius.circular(toDouble());

  /// 截断小数位，不四舍五入
  String truncateToFixed(int decimalPlaces) {
    num factor = pow(10, decimalPlaces).toDouble();
    return ((this * factor).truncate() / factor).toStringAsFixed(decimalPlaces);
  }
}
