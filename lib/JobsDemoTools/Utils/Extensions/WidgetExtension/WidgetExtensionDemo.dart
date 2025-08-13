import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/WidgetExtension/JobsWidgetExtension.dart';

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
