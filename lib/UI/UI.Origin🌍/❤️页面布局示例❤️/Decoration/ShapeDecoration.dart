import 'package:flutter/material.dart';
// ShapeDecoration 允许你使用特定的形状和渐变来装饰容器
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ShapeDecoration Demo')),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
