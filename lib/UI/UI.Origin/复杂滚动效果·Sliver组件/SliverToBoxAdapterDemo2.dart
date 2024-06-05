import 'package:flutter/material.dart';
// 自动滚动+丝滑滚动
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SmoothAutoScrollDemo(),
    );
  }
}

class SmoothAutoScrollDemo extends StatefulWidget {
  const SmoothAutoScrollDemo({super.key});

  @override
  _SmoothAutoScrollDemoState createState() => _SmoothAutoScrollDemoState();
}

class _SmoothAutoScrollDemoState extends State<SmoothAutoScrollDemo> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
      // Curves 是 Flutter 中用于定义动画曲线的类。
      // 它包含了许多预定义的静态常量，表示不同的插值函数，用于控制动画的速度和节奏。
      // 下面是 Curves 类中一些常见的曲线选项：

      // linear:线性插值，动画以恒定的速度进行。
      // ease:动画开始和结束时较慢，中间速度较快。通常用于提供平滑的过渡。
      // easeIn:动画开始时较慢，然后逐渐加速。适用于进入动画。
      // easeOut:动画开始时较快，然后逐渐减速。适用于退出动画。
      // easeInOut:动画开始和结束时较慢，中间速度较快。适用于进入和退出的平滑过渡。
      // fastOutSlowIn:动画开始时较快，然后逐渐减速。常用于 Material Design 的标准曲线。
      // bounceIn:动画开始时有一个弹跳效果，然后加速进入目标位置。
      // bounceOut:动画开始时较快，然后在结束时有一个弹跳效果。
      // bounceInOut:结合了 bounceIn 和 bounceOut 的效果，动画开始和结束时都有弹跳效果。
      // elasticIn:动画开始时有一个弹性效果，逐渐加速进入目标位置。
      // elasticOut:动画开始时较快，然后在结束时有一个弹性效果。
      // elasticInOut:结合了 elasticIn 和 elasticOut 的效果，动画开始和结束时都有弹性效果。
      // decelerate:动画开始时较快，然后逐渐减速。适用于自然的减速效果。
      // fastLinearToSlowEaseIn:画开始时是线性速度，然后逐渐减速进入目标位置。
      // slowMiddle:动画开始和结束时较快，中间部分较慢。
    ).then((_) {
      _scrollController.jumpTo(0);
      _autoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Auto Scroll Demo'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Smooth Auto Scroll'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 20,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 200.0,
          //     color: Colors.blue,
          //     child: const Center(
          //       child: Text(
          //         'SliverToBoxAdapter Content',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return ListTile(
          //         title: Text('Item #${index + 20}'),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}