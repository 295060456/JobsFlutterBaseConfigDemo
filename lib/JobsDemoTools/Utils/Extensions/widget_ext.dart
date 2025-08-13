import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';

// ============================================================================
// 🖐️ Widget Extension - 常用布局 & 手势聚合工具
// ============================================================================
extension WidgetExtension on Widget {
  // ==================== 🎯 常用布局糖 ====================
  Widget center() => Center(child: this);
  Widget padding(EdgeInsetsGeometry p) => Padding(padding: p, child: this);
  Widget margin(EdgeInsetsGeometry m) => Container(margin: m, child: this);
  Widget infinity() =>
      SizedBox(width: double.infinity, height: double.infinity, child: this);

  // ==================== 🖐️ 手势聚合（推荐） ====================
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

void main() =>
    runApp(const JobsMaterialRunner(GestureDemoPage(), title: '手势扩展示例'));

class GestureDemoPage extends StatefulWidget {
  const GestureDemoPage({super.key});

  @override
  State<GestureDemoPage> createState() => _GestureDemoPageState();
}

class _GestureDemoPageState extends State<GestureDemoPage> {
  String _log = "等待手势...";

  void _updateLog(String text) {
    setState(() => _log = text);
    debugPrint(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // 聚合 gestures 用法
        Container(
          color: Colors.blue,
          height: 100,
          width: 200,
          alignment: Alignment.center,
          child: const Text(
            "🖐 演示区\n可单击、双击、长按、拖动、缩放、鼠标中键点击",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ).center().gestures(
              onTap: () => _updateLog("👉 Tap"),
              onDoubleTap: () => _updateLog("👉 Double Tap"),
              onLongPress: () => _updateLog("👉 Long Press"),
              onScaleUpdate: (details) {
                // 平移：details.focalPointDelta
                final dx = details.focalPointDelta.dx;
                final dy = details.focalPointDelta.dy;

                // 缩放：details.scale（=1 表示纯平移）
                final scale = details.scale;

                _updateLog(
                    "👉 Scale pan(dx=$dx, dy=$dy), zoom=${scale.toStringAsFixed(2)}");
              },
              onTertiaryTapUp: (_) => _updateLog("👉 中键点击 (Tertiary Tap Up)"),
            ),

        const SizedBox(height: 20),

        // 单一糖函数写法
        Container(
          color: Colors.green,
          height: 80,
          width: 180,
          alignment: Alignment.center,
          child: const Text(
            "🖐 演示区\n可单击、长按",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        )
            .center()
            .onTap(() => _updateLog("✅ 单击"))
            .onLongPress(() => _updateLog("✅ 长按")),

        const SizedBox(height: 20),

        // 日志输出
        Text(
          _log,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}
