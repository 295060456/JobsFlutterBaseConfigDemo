import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TweenAnimationDemo());
  }
}

class TweenAnimationDemo extends StatefulWidget {
  const TweenAnimationDemo({super.key});

  @override
  State<TweenAnimationDemo> createState() => _TweenAnimationDemoState();
}

class _TweenAnimationDemoState extends State<TweenAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation; // 动画对象

  @override
  void initState() {
    super.initState();

    // 1️⃣ 初始化控制器（持续2秒）
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // 2️⃣ 设置从 0 → 0.9 的动画过程
    _animation = Tween<double>(begin: 0.0, end: 0.9).animate(_controller)
      ..addListener(() {
        setState(() {
          // 每一帧都会触发刷新，使用 _animation.value
        });
      });

    // 3️⃣ 启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // 防止内存泄露
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween 动画示例')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前值：${(_animation.value * 100).toStringAsFixed(0)}%'),
            const SizedBox(height: 20),
            LinearProgressIndicator(value: _animation.value),
          ],
        ),
      ),
    );
  }
}
