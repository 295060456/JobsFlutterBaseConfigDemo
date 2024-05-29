import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

class CustomBetLoadingIcon extends StatefulWidget {
  const CustomBetLoadingIcon({super.key});

  @override
  _CustomBetLoadingAnimationState createState() => _CustomBetLoadingAnimationState();
}

class _CustomBetLoadingAnimationState extends State<CustomBetLoadingIcon>
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
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // 设置放大动画
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
      ),
    );

    // 设置旋转动画
    _rotateAnimation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );

    // 启动动画
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 12,
      height: size + 12,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value * 0.0174533, // 转换为弧度
                child: Container(
                  width: size,
                  height: size,
                  child: Image.asset(
                    'assets/images/ic_bet_loading.webp',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
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
