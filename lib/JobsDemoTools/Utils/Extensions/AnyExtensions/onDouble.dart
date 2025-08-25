import 'package:flutter/material.dart';

extension RadiusExtension on num {
  /// 转换为 BorderRadiusGeometry
  BorderRadiusGeometry get br => BorderRadius.circular(toDouble());
}
