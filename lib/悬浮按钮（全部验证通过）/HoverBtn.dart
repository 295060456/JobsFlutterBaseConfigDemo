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
  Offset _position = const Offset(300, 600); // 初始位置在右下角
  bool returnToOrigin = true; // 控制是否返回原点
  bool isRotating = false;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    if (!isRotating) {
      _rotationController.stop();
    } else {
      _rotationController.repeat();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    setState(() {
      if (isRotating) {
        _rotationController.stop();
      } else {
        _rotationController.repeat();
      }
      isRotating = !isRotating;
    });
  }

  void _onDragEnd(DraggableDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset localOffset = renderBox.globalToLocal(details.offset);
    setState(() {
      if (returnToOrigin) {
        _position = const Offset(300, 600); // 回到初始位置
      } else {
        _position = localOffset; // 停留在拖拽的结束位置
      }
    });
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
          left: _position.dx,
          top: _position.dy,
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
        turns: _rotationController,
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
