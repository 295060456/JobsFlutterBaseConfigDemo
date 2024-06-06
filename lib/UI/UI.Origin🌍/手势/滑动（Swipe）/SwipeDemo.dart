import 'package:flutter/material.dart';

void main() {
  runApp(const SwipeDemo());
}

class SwipeDemo extends StatelessWidget {
  const SwipeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Swipe Gesture Demo')),
        body: const Center(
          child: SwipeWidget(),
        ),
      ),
    );
  }
}

class SwipeWidget extends StatefulWidget {
  const SwipeWidget({super.key});

  @override
  _SwipeWidgetState createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          debugPrint('Swipe right');
        } else if (details.velocity.pixelsPerSecond.dx < 0) {
          debugPrint('Swipe left');
        }
      },
      child: Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
        child: const Center(child: Text('Swipe Me', style: TextStyle(color: Colors.black))),
      ),
    );
  }
}
