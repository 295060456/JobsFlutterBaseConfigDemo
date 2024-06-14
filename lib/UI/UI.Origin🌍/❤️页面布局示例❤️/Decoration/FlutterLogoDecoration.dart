import 'package:flutter/material.dart';
// FlutterLogoDecoration 是一个特殊的装饰类，用于显示 Flutter 的 logo
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FlutterLogoDecoration Demo')),
        body: const Center(
          child: DecoratedBox(
            decoration: FlutterLogoDecoration(),
            child: SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
