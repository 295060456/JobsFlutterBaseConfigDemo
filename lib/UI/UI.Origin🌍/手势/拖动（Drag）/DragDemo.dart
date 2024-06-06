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