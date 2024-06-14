import 'package:flutter/material.dart';
// 展示了如何在 Column 或 Row 中使用 Expanded 小部件来填充可用空间：
// Column 包含三个 Container 小部件。
// 第一个 Container 和最后一个 Container 有固定的高度 100。
// 中间的 Container 被 Expanded 小部件包裹，这样它将占据剩余的可用空间。
// 每个 Container 具有不同的背景颜色以便于区分。
// Expanded 小部件的作用是使其子小部件在主轴方向上填充所有可用的剩余空间。在这个例子中，绿色的 Container 将扩展以填充除红色和蓝色 Container 占用空间之外的所有剩余空间。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandedDemo(),
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Demo'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            child: const Center(child: Text('Fixed Height Container')),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(child: Text('Expanded Container')),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            child: const Center(child: Text('Fixed Height Container')),
          ),
        ],
      ),
    );
  }
}
