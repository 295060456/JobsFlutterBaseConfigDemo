import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Draggable Button Example')),
        body: const DraggableButton(),
      ),
    );
  }
}

class DraggableButton extends StatefulWidget {
  const DraggableButton({super.key});

  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton>
    with SingleTickerProviderStateMixin {
  double posX = 0.0;
  double posY = 0.0;
  bool returnToOrigin = false;
  bool isRotating = false;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    setState(() {
      if (isRotating) {
        _controller?.stop();
      } else {
        _controller?.repeat();
      }
      isRotating = !isRotating;
    });
  }

  void _onDragEnd(DraggableDetails details) {
    if (returnToOrigin) {
      setState(() {
        posX = 0.0;
        posY = 0.0;
      });
    }
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: List.generate(
            10,
            (index) => ListTile(
              title: Text('Menu Item $index'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: posY,
          right: posX,
          child: GestureDetector(
            onLongPress: _showMenu,
            child: Draggable(
              feedback: _buildButton(),
              childWhenDragging: Container(),
              onDragEnd: _onDragEnd,
              child: _buildButton(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: _toggleRotation,
      child: RotationTransition(
        turns: _controller!,
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Center(
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
