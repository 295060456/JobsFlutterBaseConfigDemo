import 'package:flutter/material.dart';

void main() {
  runApp(const DragDemo());
}

class DragDemo extends StatelessWidget {
  const DragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Drag Gesture Demo')),
        body: Center(
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              debugPrint('Horizontal drag: ${details.delta.dx}');
            },
            onVerticalDragUpdate: (details) {
              debugPrint('Vertical drag: ${details.delta.dy}');
            },
            onPanUpdate: (details) {
              debugPrint('Pan: ${details.delta}');
            },
            child: Container(
              color: Colors.green,
              width: 100,
              height: 100,
              child: const Center(child: Text('Drag Me', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}


  // 类似于Future。GlobalKey这个大类型里面包裹的是FormState这样的小的具体的类型。
  // 和iOS的key不同（iOS需要手动创建全剧唯一的static字符串），存取铆定这个字符串
  // Flutter创建这个全局的Key类似，只不过不一定是字符串类型，你也不需要管他具体是什么

  // 创建完了以后，铆定UI。没有设定就是原始的super.key