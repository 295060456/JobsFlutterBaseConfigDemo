import 'package:flutter/material.dart';

// 使用示例
// Text("点我试试,试试就试试")
//   .center()                                      // 居中
//   .align(Alignment.bottomRight)                  // 指定对齐方式
//   .padding(const EdgeInsets.all(12))             // 内边距
//   .margin(const EdgeInsets.only(bottom: 20))     // 外边距
//   .backgroundColor(Colors.blueAccent)            // 背景色
//   .border(color: Colors.white, width: 2)         // 边框
//   .radius(16)                                    // 圆角
//   .size(width: 200, height: 60)                  // 固定宽高
//   .tooltip("这是一个按钮")                         // Tooltip 提示
//   .opacity(0.9)                                  // 透明度
//   .rotate(0.1)                                   // 旋转（单位是弧度）
//   .scale(1.1)                                    // 缩放
//   .transform(Matrix4.translationValues(5, 0, 0)) // 位移变换
//   .clipOval()                                    // 裁剪成圆形
//   .hero("myHeroTag")                             // Hero 动画（需配合页面跳转）
//   .safeArea()                                    // SafeArea 包裹
//   .scrollable()                                  // 可滚动包裹
//   .onTap(() => print("✅ 点击了按钮"))             // 点击事件
//   .onLongPress(() => print("⏱️ 长按触发"));        // 长按事件

/// 语法糖🍬，简化代码，方便阅读📖
extension JobsWidgetExtension on Widget {
  /// 居中
  Widget center() => Center(child: this);
  /// 居左
  Widget alignLeft() => Align(alignment: Alignment.centerLeft, child: this);
  /// 居右
  Widget alignRight() => Align(alignment: Alignment.centerRight, child: this);
  /// 居上
  Widget alignTop() => Align(alignment: Alignment.topCenter, child: this);
  /// 居下
  Widget alignBottom() => Align(alignment: Alignment.bottomCenter, child: this);
  /// 指定对齐方式
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);
  /// 添加 Padding
  Widget padding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: this);
  /// 添加 Margin
  Widget margin(EdgeInsetsGeometry margin) =>
      Container(margin: margin, child: this);
  /// 添加背景色
  Widget backgroundColor(Color color) =>
      Container(color: color, child: this);
  /// 添加边框
  Widget border({
    Color color = Colors.black,
    double width = 1.0,
    BorderRadiusGeometry? radius,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: radius,
        ),
        child: this,
      );

  /// 添加圆角
  Widget radius([double r = 8.0]) => ClipRRect(
        borderRadius: BorderRadius.circular(r),
        child: this,
      );
  /// 添加固定宽高
  Widget size({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);
  /// 占满父容器
  Widget infinity() =>
      SizedBox(width: double.infinity, height: double.infinity, child: this);
  /// 添加点击事件（最常用）
  GestureDetector onTap(Function()? fn,
          [String? type, String? value, String? id]) =>
      GestureDetector(
        onTap: () {
          fn?.call();
          // 可扩展日志、埋点等
        },
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  /// 添加长按事件
  GestureDetector onLongPress(Function()? fn) => GestureDetector(
        onLongPress: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  /// 添加 Tooltip 提示
  Widget tooltip(String message) => Tooltip(
        message: message,
        child: this,
      );
  /// 设置透明度
  Widget opacity(double value) => Opacity(opacity: value, child: this);
  /// 设置旋转角度（单位：弧度）
  Widget rotate(double radians) => Transform.rotate(
        angle: radians,
        child: this,
      );
  /// 添加缩放
  Widget scale(double factor) => Transform.scale(
        scale: factor,
        child: this,
      );
  /// 添加 Transform（可旋转/缩放/位移）
  Widget transform(Matrix4 matrix) => Transform(
        transform: matrix,
        child: this,
      );
  /// 添加 Hero 动画（需配合 tag 使用）
  Widget hero(String tag) => Hero(tag: tag, child: this);
  /// 添加 ClipOval 圆形裁剪
  Widget clipOval() => ClipOval(child: this);
  /// 添加 SafeArea 包裹
  Widget safeArea() => SafeArea(child: this);
  /// 可滚动包裹
  Widget scrollable({Axis scrollDirection = Axis.vertical}) =>
      SingleChildScrollView(
        scrollDirection: scrollDirection,
        child: this,
      );
}
