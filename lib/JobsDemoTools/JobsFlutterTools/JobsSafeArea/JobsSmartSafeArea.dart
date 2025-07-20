import 'dart:math' as math;
import 'package:flutter/material.dart';

// JobsSmartSafeArea(
//   top: true,
//   bottom: true,
//   child: YourPage(),
// )

class JobsSmartSafeArea extends StatelessWidget {
  final Widget child;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;

  const JobsSmartSafeArea({
    super.key,
    required this.child,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool alreadyInSafeArea = context.findAncestorWidgetOfExactType<SafeArea>() != null;

    if (alreadyInSafeArea) {
      // ✅ 如果上层已经是 SafeArea，我们只做 removePadding 避免叠加
      return MediaQuery.removePadding(
        context: context,
        removeTop: top,
        removeBottom: bottom,
        removeLeft: left,
        removeRight: right,
        child: child,
      );
    } else {
      // ✅ 顶层 SafeArea，正常构建（仿照 Flutter SDK 的 SafeArea 实现）
      EdgeInsets padding = MediaQuery.paddingOf(context);
      if (maintainBottomViewPadding) {
        padding = padding.copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom);
      }

      return Padding(
        padding: EdgeInsets.only(
          left: math.max(left ? padding.left : 0.0, minimum.left),
          top: math.max(top ? padding.top : 0.0, minimum.top),
          right: math.max(right ? padding.right : 0.0, minimum.right),
          bottom: math.max(bottom ? padding.bottom : 0.0, minimum.bottom),
        ),
        child: MediaQuery.removePadding(
          context: context,
          removeLeft: left,
          removeTop: top,
          removeRight: right,
          removeBottom: bottom,
          child: child,
        ),
      );
    }
  }
}
