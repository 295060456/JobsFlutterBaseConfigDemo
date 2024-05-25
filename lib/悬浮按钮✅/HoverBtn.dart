import 'package:flutter/material.dart';
// 1、画一个圆形按钮，初始位置在右下角（具体位置也可以手动设置）
// 2、可以拖动，但有两种模式，可以在代码里面通过bool值进行改变
//     2.1、拖动到任意位置，放手以后这个圆形按钮回到原来的初始位置，中间是有回弹的一个动画的
//     2.2、拖动到任意位置，放手以后，这个按钮就在此刻的位置，不会改变
// 3、点击这个按钮会360度的旋转，再次点击会暂停旋转，再次点击会接着旋转
// 4、长按这个按钮，会出现一个菜单，类似于UITableView，这个菜单会显示在这个页面更加宽阔的区域
// 5、按钮上面有图，图就是一个环形的箭头，以表明显示旋转的方向
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
