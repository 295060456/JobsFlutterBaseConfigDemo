import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';


///自定义分割线
class CustomDividerWidget extends StatelessWidget {
  final double? height;
  final Color? color;

  const CustomDividerWidget({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: height ?? 1,
      color: color ?? ThemeService().colorScheme.tertiary,
    );
  }
}

enum DividerType {
  circle,
  halfCircle,
}

/// 特殊 圆形/半圆形 分割线
/// DividerCirclesWidget(type: DividerType.circle),
/// DividerCirclesWidget(type: DividerType.halfCircle),
class CustomCirclesDivider extends StatelessWidget {
  DividerType type;
  double width;
  double height;

  // 圆形大小
  double circleRadius;

  // 大约间隔
  double spacing;

  // 圆形绘制颜色
  Color? color;

  // 组件backgroundColor
  Color? backgroundColor;

  CustomCirclesDivider(
      {super.key,
      this.type = DividerType.halfCircle,
      this.width = double.infinity,
      this.height = 8.0,
      this.circleRadius = 4.0,
      this.spacing = 5.0,
      this.color,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final olorScheme = ThemeService().theme.colorScheme;

    /// TODO 0xff17313D 未定义
    final defaultBackgroundColor =
        type == DividerType.circle ? Colors.transparent : Color(0xff17313D);
    final defaultColor = olorScheme.surface;

    return ClipRect(
      child: Container(
        color: backgroundColor ?? defaultBackgroundColor,
        child: CustomPaint(
            size: Size(width, height),
            painter: CirclesPainter(
              type: type,
              circleRadius: circleRadius,
              spacing: spacing,
              color: color ?? defaultColor,
            )),
      ),
    );
  }
}

class CirclesPainter extends CustomPainter {
  final DividerType type;
  final double circleRadius;
  final double spacing;
  final Color color;

  CirclesPainter({
    required this.type,
    required this.circleRadius,
    required this.spacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    final centerY = type == DividerType.circle ? size.height / 2 : size.height;
    final numberOfCircles = (size.width - spacing) ~/ (circleRadius * 2 + spacing);
    final newSpacing = (size.width - circleRadius * 2 * numberOfCircles) / (numberOfCircles + 1);

    for (var i = 0; i < numberOfCircles; i++) {
      final centerX = (i * (circleRadius * 2 + newSpacing)) + circleRadius + newSpacing;
      canvas.drawCircle(Offset(centerX, centerY), circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
