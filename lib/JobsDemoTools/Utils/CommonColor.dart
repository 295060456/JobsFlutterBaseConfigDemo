import 'package:flutter/material.dart';

Color JobsColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 8) {
    // #RRGGBBAA → 0xAARRGGBB
    final rrggbb = hexColor.substring(0, 6);
    final aa = hexColor.substring(6);
    return Color(int.parse("0x$aa$rrggbb"));
  } else if (hexColor.length == 6) {
    // #RRGGBB → 默认不透明
    return Color(int.parse("0xFF$hexColor"));
  } else {
    throw const FormatException("颜色格式错误: #RRGGBBAA or #RRGGBB expected");
  }
}

const Color theme01MainColor = Color(0xFF10C8E3);
