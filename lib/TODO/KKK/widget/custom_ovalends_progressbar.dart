import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/theme/theme_service.dart';

class OvalEndsProgressBar extends CustomPainter {
  final double progress;
  final Color? bgColor ;
  final Color? valueColor;
  

  OvalEndsProgressBar({ required this.progress, this.bgColor, this.valueColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = bgColor??ThemeService().colorScheme.tertiary
      ..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
      ..color = valueColor??ThemeService().colorScheme.primaryContainer
      ..style = PaintingStyle.fill;

    // 绘制背景
    canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(size.height / 2)),
        backgroundPaint);


    // 计算实际进度的宽度
    double progressWidth = size.width * progress;

    // 绘制进度条，两端为椭圆形状
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, progressWidth, size.height), Radius.circular(size.height / 2)),
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}