import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 初始大小
  double _width = 80.0;
  double _height = 40.0;

  // 切换大小的函数
  void _changeSize() {
    setState(() {
      // 切换大小
      if (_width == 80.0 && _height == 40.0) {
        _width = 60.0;
        _height = 100.0;
      } else {
        _width = 80.0;
        _height = 40.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Button Demo'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: const Duration(seconds: 1), // 过渡动画的持续时间
          curve: Curves.easeInOut, // 过渡动画的曲线
          child: ElevatedButton(
            onPressed: _changeSize,
            child: const Text('Click Me'),
          ),
        ),
      ),
    );
  }
}
