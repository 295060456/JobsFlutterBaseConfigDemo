import 'dart:ui';

import 'package:flutter/material.dart';

class PointTabIndicator extends Decoration {
  const PointTabIndicator({
    this.color = Colors.black,
    this.insets = EdgeInsets.zero,
  });

  final Color color;
  final EdgeInsetsGeometry insets;


  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is PointTabIndicator) {
      return PointTabIndicator(
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is PointTabIndicator) {
      return PointTabIndicator(
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _PointPainter createBoxPainter([VoidCallback? onChanged]) {
    return _PointPainter(this, onChanged);
  }
}

class _PointPainter extends BoxPainter {
  _PointPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final PointTabIndicator decoration;

  Color get color => decoration.color;

  EdgeInsetsGeometry get insets => decoration.insets;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = offset & configuration.size!;
    final TextDirection? textDirection = configuration.textDirection;
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    double starDx = indicator.left + indicator.width / 2 - 6;
    var path = Path();
    path.moveTo(starDx, 0);
    path.lineTo(starDx, 2);
    path.cubicTo(starDx, 4, starDx + 2, 6, starDx + 4, 6);
    path.lineTo(starDx+8, 6);
    path.cubicTo(starDx + 10, 6, starDx + 12, 4, starDx + 12, 2);
    path.lineTo(starDx+12, 0);
    canvas.drawPath(path, paint);
  }
}
