import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_text.dart';

import 'custom_asset_icon.dart';

class RotatingArrow extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color activeColor;
  final Color? color;

  const RotatingArrow({
    super.key,
    this.size = 18.0,
    this.duration = const Duration(milliseconds: 300),
    this.activeColor = Colors.white,
    this.color,
  });

  @override
  RotatingArrowState createState() => RotatingArrowState();
}

class RotatingArrowState extends State<RotatingArrow> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;
  bool showed = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0, end: 0.5).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.stop();
        }
      });
  }

  void startAnimation() {
    animationController.forward();
    showed = true;
  }

  void resetAnimation() {
    animationController.reset();
    Future.delayed(const Duration(milliseconds: 100), () {
      showed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: CustomAssetIcon(
        name: "assets/images/top_drop_down arrow.png",
        size: widget.size,
        color: showed ? widget.activeColor : widget.color??const Color(0xffa6b2cb),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ScalingText extends StatefulWidget {
  final double scale;
  final Duration duration;
  final String text;
  final TextStyle textStyle;
  const ScalingText({
    super.key,
    this.scale = 0.8,
    this.duration = const Duration(milliseconds: 50),
    required this.text,
    required this.textStyle,
  });

  @override
  ScalingTextState createState() => ScalingTextState();
}

class ScalingTextState extends State<ScalingText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  void startAnimation() {
    _controller.forward();
  }

  void resetAnimation() {
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: CustomText(
        widget.text,
        style: widget.textStyle,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 缩放组件
class ScalingWidget extends StatefulWidget {
  final double scale;
  final Duration duration;
  final Widget child;
  const ScalingWidget({
    super.key,
    this.scale = 0.8,
    this.duration = const Duration(milliseconds: 50),
    required this.child
  });

  @override
  ScalingWidgetState createState() => ScalingWidgetState();
}

class ScalingWidgetState extends State<ScalingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  void startAnimation() {
    _controller.forward();
  }

  void resetAnimation() {
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

