import 'package:flutter/material.dart';

void main() {
  runApp(const ScaleDemo());
}

class ScaleDemo extends StatelessWidget {
  const ScaleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Scale Gesture Demo')),
        body: const Center(
          child: ScaleWidget(),
        ),
      ),
    );
  }
}

class ScaleWidget extends StatefulWidget {
  const ScaleWidget({super.key});

  @override
  _ScaleWidgetState createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        debugPrint('Scale start');
      },
      onScaleUpdate: (details) {
        setState(() {
          _scale = details.scale;
        });
        debugPrint('Scale update: ${details.scale}');
      },
      onScaleEnd: (details) {
        debugPrint('Scale end');
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          child: const Center(child: Text('Scale Me', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
