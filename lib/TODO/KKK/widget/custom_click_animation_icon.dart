import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

class CustomClickAnimationIcon extends StatefulWidget {
  const CustomClickAnimationIcon({super.key});

  @override
  _CustomClickAnimationState createState() => _CustomClickAnimationState();
}

class _CustomClickAnimationState extends State<CustomClickAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  double size = 18;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 设置放大动画
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // 设置旋转动画
    _rotateAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween(begin: 0.0, end: -0.06),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    // 启动动画
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 8,
      height: size + 14,
      child: Center(
        child: RotationTransition(
          turns: _rotateAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: size,
              height: size + 6,
              child: Image.asset(
                'assets/images/activity/ic_red_click.webp',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放动画控制器资源
    _controller.dispose();
    super.dispose();
  }
}
