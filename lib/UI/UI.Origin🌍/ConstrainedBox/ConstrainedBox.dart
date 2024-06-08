import 'package:flutter/material.dart';
// 使用 ConstrainedBox 小部件包裹一个 Container 小部件。
// ConstrainedBox 设置了大小限制，其中 minWidth 为 200，minHeight 为 100，maxWidth 为 300，maxHeight 为 200。
// Container 被限制在这些尺寸范围内，并显示一个蓝色背景和居中的文本。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConstrainedBoxDemo(),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstrainedBox Demo'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 200,
            minHeight: 100,
            maxWidth: 300,
            maxHeight: 200,
          ),
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Constrained Box',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
