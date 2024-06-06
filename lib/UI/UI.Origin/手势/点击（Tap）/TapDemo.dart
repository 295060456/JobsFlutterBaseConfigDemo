import 'package:flutter/material.dart';

void main() {
  runApp(const TapDemo());
}

class TapDemo extends StatelessWidget {
  const TapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Tap Gesture Demo')),
        body: Center(
          child: GestureDetector(
            onTap: () {
              debugPrint('Single tap');
            },
            onDoubleTap: () {
              debugPrint('Double tap');
            },
            onLongPress: () {
              debugPrint('Long press');
            },
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: const Center(child: Text('Tap Me', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
