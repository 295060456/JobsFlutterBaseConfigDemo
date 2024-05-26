import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'dart:math'; // 导入 dart:math 库

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Shape Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomShapeButton(
                shape: Shape.triangle,
                onPressed: () {
                  debugPrint('我是三角形按钮');
                  Vibration.vibrate(duration: 200);
                },
              ),
              const SizedBox(height: 20),
              CustomShapeButton(
                shape: Shape.star,
                onPressed: () {
                  debugPrint('我是五角星按钮');
                  Vibration.vibrate(duration: 200);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Shape { triangle, star }

class CustomShapeButton extends StatelessWidget {
  final Shape shape;
  final VoidCallback onPressed;

  const CustomShapeButton({super.key, required this.shape, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        size: const Size(100, 100),
        painter: ShapePainter(shape),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final Shape shape;

  ShapePainter(this.shape);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    switch (shape) {
      case Shape.triangle:
        drawTriangle(canvas, size, paint);
        break;
      case Shape.star:
        drawStar(canvas, size, paint);
        break;
    }
  }

  void drawTriangle(Canvas canvas, Size size, Paint paint) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawStar(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius / 2.5;
    const angle = 72 * pi / 180;

    for (int i = 0; i < 5; i++) {
      final outerPoint = Offset(
        size.width / 2 + outerRadius * cos(i * 2 * angle),
        size.height / 2 - outerRadius * sin(i * 2 * angle),
      );
      final innerPoint = Offset(
        size.width / 2 + innerRadius * cos((i * 2 + 1) * angle),
        size.height / 2 - innerRadius * sin((i * 2 + 1) * angle),
      );
      if (i == 0) {
        path.moveTo(outerPoint.dx, outerPoint.dy);
      } else {
        path.lineTo(outerPoint.dx, outerPoint.dy);
      }
      path.lineTo(innerPoint.dx, innerPoint.dy);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
