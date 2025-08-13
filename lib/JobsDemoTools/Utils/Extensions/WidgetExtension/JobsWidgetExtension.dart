import 'package:flutter/gestures.dart';
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

/// 🍬语法糖：简化代码，方便阅读📖
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

// // =============== 示例 1：点击/双击/长按 =================
// Center(
//   child: Text(
//     '点我试试（Tap / DoubleTap / LongPress）',
//     style: const TextStyle(color: Colors.white),
//   )
//       .padding(const EdgeInsets.symmetric(
//           horizontal: 16, vertical: 12))
//       .backgroundColor(Colors.blueAccent)
//       .radius(12)
//       // 语法糖：点击
//       .onTap(() => _setLog('👆 onTap'))
//       // 语法糖：双击
//       .onDoubleTap(() => _setLog('👆👆 onDoubleTap'))
//       // 语法糖：长按
//       .onLongPress(() => _setLog('✋ onLongPress'))
// ),

// =============== 示例 2：自由拖拽（Pan 系列） =================
// Positioned(
//   left: _pos.dx,
//   top: _pos.dy,
//   child: Container(
//     width: 120,
//     height: 120,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       color: Colors.redAccent,
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: const Text(
//       '拖我（Pan）',
//       style: TextStyle(color: Colors.white),
//     ),
//   ).onPan(
//     start: (d) => _setLog('🧲 panStart: ${d.globalPosition}'),
//     update: (d) {
//       setState(() => _pos += d.delta);
//       _setLog('📦 panUpdate: Δ=${d.delta}');
//     },
//     end: (d) => _setLog('🏁 panEnd: v=${d.velocity.pixelsPerSecond}'),
//   ),
// ),

// =============== 示例 3：缩放+平移（仅 Scale 系列） =================
// 注意：使用 onScale* 后，你的扩展会自动禁用 Pan 系列，避免冲突。
// Positioned.fill(
//   child: Transform.translate(
//     offset: _canvasOffset,
//     child: Transform.scale(
//       scale: _scale,
//       alignment: Alignment.center,
//       child: Container(
//         width: 160,
//         height: 160,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Colors.teal,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: const Text(
//           '捏合缩放 / 两指拖动画布\n(Scale 系列)',
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.white),
//         ),
//       )
//           // 语法糖：Scale（含平移：用 focalPointDelta 实现）
//           .onScale(
//         start: (details) {
//           _scaleStart = _scale;
//           _setLog('🔍 scaleStart: f=${details.focalPoint}');
//         },
//         update: (details) {
//           // 缩放
//           final newScale =
//               (_scaleStart * details.scale).clamp(0.5, 3.0);
//           // 平移（两指拖动时 focalPointDelta 生效；单指也会有）
//           final delta = details.focalPointDelta;

//           setState(() {
//             _scale = newScale;
//             _canvasOffset += delta;
//           });

//           _setLog(
//               '🔎 scaleUpdate: scale=${newScale.toStringAsFixed(2)} '
//               'Δ=${delta.dx.toStringAsFixed(1)},${delta.dy.toStringAsFixed(1)}');
//         },
//         end: (details) => _setLog('✅ scaleEnd'),
//       ),
//     ),
//   ),
// ),

// ====== （可选）示例 4：二级/三级点击（桌面/鼠标有用，移动端通常无效） ======
// Positioned(
//   right: 16,
//   bottom: 16,
//   child: Container(
//     padding:
//         const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//     decoration: BoxDecoration(
//       color: Colors.black87,
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: const Text(
//       'Secondary / Tertiary Tap\n(鼠标右键/中键)',
//       style: TextStyle(color: Colors.white),
//       textAlign: TextAlign.center,
//     ),
//   ).gestures(
//     // 右键（secondary）、中键（tertiary）在桌面/网页更有意义
//     onSecondaryTapDown: (_) => _setLog('🖱 onSecondaryTapDown'),
//     onSecondaryTap: () => _setLog('🖱 onSecondaryTap'),
//     onTertiaryTapDown: (_) => _setLog('🖱 onTertiaryTapDown'),
//     onTertiaryTapCancel: () => _setLog('🖱 onTertiaryTapCancel'),
//   ),
// ),

/// 🍬语法糖：手势聚合
extension WidgetExtension on Widget {
  Widget gestures({
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    // ==== Tap ====
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,

    // ==== Secondary Tap ====
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCallback? onSecondaryTap,
    GestureTapCancelCallback? onSecondaryTapCancel,

    // ==== Tertiary Tap ====
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureTapCancelCallback? onTertiaryTapCancel,

    // ==== Double Tap ====
    GestureTapDownCallback? onDoubleTapDown,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,

    // ==== Long Press ====
    GestureLongPressDownCallback? onLongPressDown,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,

    // ==== Pan（自由拖拽）====
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,

    // ==== 水平拖拽 ====
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,

    // ==== 垂直拖拽 ====
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,

    // ==== 缩放（Pan 的超集）====
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
  }) {
    // ==== 🚨 冲突检测：Scale 与 Pan 系列不能同时使用 ====
    final hasScale =
        onScaleStart != null || onScaleUpdate != null || onScaleEnd != null;
    final hasAnyPan = onPanStart != null ||
        onPanUpdate != null ||
        onPanEnd != null ||
        onPanCancel != null ||
        onHorizontalDragStart != null ||
        onHorizontalDragUpdate != null ||
        onHorizontalDragEnd != null ||
        onHorizontalDragCancel != null ||
        onVerticalDragStart != null ||
        onVerticalDragUpdate != null ||
        onVerticalDragEnd != null ||
        onVerticalDragCancel != null;

    assert(
        !(hasScale && hasAnyPan),
        '❌ GestureDetector 冲突：Scale 已包含 Pan 功能，不可同时声明。'
        '👉 如果需要拖拽 + 缩放，请仅使用 Scale 系列回调（focalPointDelta 处理平移，scale 处理缩放）。');

    // ==== Release 环境自动屏蔽冲突 ====
    final enablePan = !hasScale;

    return GestureDetector(
      key: key,
      behavior: behavior ?? HitTestBehavior.opaque,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,

      // Tap
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,

      // Secondary
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapCancel: onSecondaryTapCancel,

      // Tertiary
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel,

      // Double Tap
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,

      // Long Press
      onLongPressDown: onLongPressDown,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,

      // Pan / Drag（仅当未使用 Scale 时才生效）
      onPanStart: enablePan ? onPanStart : null,
      onPanUpdate: enablePan ? onPanUpdate : null,
      onPanEnd: enablePan ? onPanEnd : null,
      onPanCancel: enablePan ? onPanCancel : null,

      onHorizontalDragStart: enablePan ? onHorizontalDragStart : null,
      onHorizontalDragUpdate: enablePan ? onHorizontalDragUpdate : null,
      onHorizontalDragEnd: enablePan ? onHorizontalDragEnd : null,
      onHorizontalDragCancel: enablePan ? onHorizontalDragCancel : null,

      onVerticalDragStart: enablePan ? onVerticalDragStart : null,
      onVerticalDragUpdate: enablePan ? onVerticalDragUpdate : null,
      onVerticalDragEnd: enablePan ? onVerticalDragEnd : null,
      onVerticalDragCancel: enablePan ? onVerticalDragCancel : null,

      // Scale
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,

      child: this,
    );
  }

  // ==================== 🎯 常用手势语法糖 ====================
  Widget onTap(GestureTapCallback? fn,
          {HitTestBehavior behavior = HitTestBehavior.opaque}) =>
      gestures(onTap: fn, behavior: behavior);

  Widget onDoubleTap(GestureTapCallback? fn,
          {HitTestBehavior behavior = HitTestBehavior.opaque}) =>
      gestures(onDoubleTap: fn, behavior: behavior);

  Widget onLongPress(GestureLongPressCallback? fn,
          {HitTestBehavior behavior = HitTestBehavior.opaque}) =>
      gestures(onLongPress: fn, behavior: behavior);

  Widget onPan({
    GestureDragStartCallback? start,
    GestureDragUpdateCallback? update,
    GestureDragEndCallback? end,
    GestureDragCancelCallback? cancel,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) =>
      gestures(
        onPanStart: start,
        onPanUpdate: update,
        onPanEnd: end,
        onPanCancel: cancel,
        behavior: behavior,
      );

  Widget onHorizontalDrag({
    GestureDragStartCallback? start,
    GestureDragUpdateCallback? update,
    GestureDragEndCallback? end,
    GestureDragCancelCallback? cancel,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) =>
      gestures(
        onHorizontalDragStart: start,
        onHorizontalDragUpdate: update,
        onHorizontalDragEnd: end,
        onHorizontalDragCancel: cancel,
        behavior: behavior,
      );

  Widget onVerticalDrag({
    GestureDragStartCallback? start,
    GestureDragUpdateCallback? update,
    GestureDragEndCallback? end,
    GestureDragCancelCallback? cancel,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) =>
      gestures(
        onVerticalDragStart: start,
        onVerticalDragUpdate: update,
        onVerticalDragEnd: end,
        onVerticalDragCancel: cancel,
        behavior: behavior,
      );

  Widget onScale({
    GestureScaleStartCallback? start,
    GestureScaleUpdateCallback? update,
    GestureScaleEndCallback? end,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) =>
      gestures(
        onScaleStart: start,
        onScaleUpdate: update,
        onScaleEnd: end,
        behavior: behavior,
      );
}
