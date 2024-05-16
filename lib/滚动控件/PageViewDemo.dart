import 'package:flutter/material.dart';
// 水平滚动的时候，一格一格的滚动，滚动距离为设备宽度，高度随内容变化；有弹簧效果
// 垂直滚动的时候，一格一格的滚动，滚动距离为设备高度，宽度随内容变化；有弹簧效果
// 真机运行如果出现空白页面，则在工程根目录下执行 flutter run --release
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PageView Demo',
      home: PageViewDemo(),
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const isVertical = true; // 设置为 true 以垂直滚动
 // const isVertical = false; // 设置为 false 以水平滚动

    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Demo'),
      ),
      body: PageView(
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        pageSnapping: true,
        children: List.generate(
          3,
          (index) => Container(
            width: isVertical ? double.infinity : MediaQuery.of(context).size.width,
            height: isVertical ? MediaQuery.of(context).size.height : double.infinity,
            color: index % 2 == 0 ? Colors.red : Colors.blue,
            child: Center(
              child: Text('Page ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
