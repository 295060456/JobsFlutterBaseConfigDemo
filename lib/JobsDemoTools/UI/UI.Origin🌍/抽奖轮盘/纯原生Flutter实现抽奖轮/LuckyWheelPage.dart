import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/JobsCommonUtil.dart';
import 'package:jobs_flutter_base_config/core/app_config.dart';

// 🎯 Flutter 抽奖轮盘完整封装组件
// 功能：
// - 自定义奖项、图标、概率
// - 动画音效、晃动、闪光、放大动效
// - 网络图片缓存
// - 📈 中奖记录展示

// 纯原生 Flutter 实现抽奖轮盘（推荐，灵活可控）
// 🔧 效果原理
// 用 CustomPaint 或者直接用 Stack 构建转盘 UI；
// 用 Transform.rotate 来旋转整个转盘；
// 用 AnimationController 控制转盘旋转角度；
// 动画结束后计算当前停在哪一项，回调告诉你抽到了哪一项。

void main() => runApp(JobsMaterialRunner(
      LuckyWheelWidget(
        rewards: [
          RewardItem('一等奖', 0.05,
              icon: const AssetImage('assets/Images/flower.png')),
          RewardItem('二等奖', 0.1,
              imageUrl:
                  'https://img.icons8.com/emoji/48/000000/smiling-face.png'),
          RewardItem('三等奖', 0.15),
          RewardItem('谢谢参与', 0.4),
          RewardItem('四等奖', 0.2),
          RewardItem('五等奖', 0.1),
        ],
      ),
      title: '通用转盘 ⬆️ 支持任意指针方向@Flutter原生',
    ));

class RewardItem {
  final String label;
  final double probability;
  final ImageProvider? icon;
  final String? imageUrl;
  ui.Image? resolvedIcon; // 加载后缓存

  RewardItem(this.label, this.probability, {this.icon, this.imageUrl});
}

class LuckyWheelWidget extends StatefulWidget {
  final List<RewardItem> rewards;
  final double size;
  final void Function(String label)? onResult;

  const LuckyWheelWidget(
      {super.key, required this.rewards, this.size = 320, this.onResult});

  @override
  State<LuckyWheelWidget> createState() => _LuckyWheelWidgetState();
}

class _LuckyWheelWidgetState extends State<LuckyWheelWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final double _pointerAngle = 0;
  double _angle = 0;
  final List<String> _history = []; // 🎯 中奖记录

  int get _numItems => widget.rewards.length;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _resolveAllIcons();
  }

  Future<void> _resolveAllIcons() async {
    for (final reward in widget.rewards) {
      if (reward.icon != null) {
        final completer = Completer<ui.Image>();
        final stream = reward.icon!.resolve(const ImageConfiguration());
        late final ImageStreamListener listener;
        listener = ImageStreamListener((imageInfo, _) {
          completer.complete(imageInfo.image);
          stream.removeListener(listener);
        });
        stream.addListener(listener);
        reward.resolvedIcon = await completer.future;
      }
    }
    setState(() {});
  }

  Future<void> _startLottery() async {
    final spins = 6;
    final sectionAngle = 2 * pi / _numItems;
    final targetIndex = _pickRewardByProbability();
    final targetAngle = 2 * pi * spins + sectionAngle * targetIndex;

    _animation = Tween<double>(begin: _angle, end: targetAngle).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    )..addListener(() => setState(() => _angle = _animation.value));

    final timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      _audioPlayer.play(AssetSource('assets/Sounds/spin.mp3'));
    });

    _controller.forward(from: 0).whenComplete(() {
      timer.cancel();

      // ✅ 计算中奖索引
      final resultIndex = LuckyUtils.getIndexFromAngle(
        angle: _angle,
        count: _numItems,
      );
      final result = widget.rewards[resultIndex].label;

      // 🧪 打印调试信息
      JobsPrint('🧭 当前旋转角度（弧度）: ${_angle.toStringAsFixed(4)}');
      JobsPrint('📐 扇区数: $_numItems');
      JobsPrint('🎯 命中扇区索引: $resultIndex');
      JobsPrint('🏆 抽中的奖项: $result');

      // ✅ 更新中奖记录 + 弹窗
      _history.insert(0, result);
      widget.onResult?.call(result);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('🎯 抽奖结果'),
          content: Text('你抽中了：$result'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('确定'),
            )
          ],
        ),
      );
    });
  }

  int _pickRewardByProbability() {
    final total =
        widget.rewards.fold<double>(0, (sum, r) => sum + r.probability);
    final rand = Random().nextDouble() * total;
    double acc = 0;
    for (int i = 0; i < widget.rewards.length; i++) {
      acc += widget.rewards[i].probability;
      if (rand <= acc) return i;
    }
    return widget.rewards.length - 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _angle,
              child: CustomPaint(
                size: Size(widget.size, widget.size),
                painter: WheelPainter(widget.rewards),
              ),
            ),
            const AnimatedPointer(),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _startLottery,
          child: Text('开始抽奖', style: normalTextStyle()),
        ),
        const SizedBox(height: 10),
        Text('📈 中奖记录', style: const TextStyle(fontWeight: FontWeight.bold)),
        ..._history.take(5).map((e) => Text('🎁 $e')),
      ],
    );
  }
}

class AnimatedPointer extends StatefulWidget {
  const AnimatedPointer({super.key});

  @override
  State<AnimatedPointer> createState() => _AnimatedPointerState();
}

class _AnimatedPointerState extends State<AnimatedPointer>
    with TickerProviderStateMixin {
  late AnimationController _breathCtrl;
  late AnimationController _flashCtrl;
  late Animation<double> _scaleAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _breathCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _flashCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);

    _scaleAnim = Tween(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _breathCtrl, curve: Curves.easeInOut));
    _opacityAnim = Tween(begin: 0.5, end: 1.0).animate(_flashCtrl);
  }

  @override
  void dispose() {
    _breathCtrl.dispose();
    _flashCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Transform.rotate(
          angle: 0,
          child: SizedBox(
            // ⚠️ 用 SizedBox 包裹 CustomPaint 以解决 Impeller 透明度继承问题
            width: 20,
            height: 30,
            child: CustomPaint(
              painter: TrianglePointerPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class TrianglePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.translate(size.width / 2, 0);

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(-size.width / 2, size.height)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WheelPainter extends CustomPainter {
  final List<RewardItem> rewards;
  WheelPainter(this.rewards);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final angle = 2 * pi / rewards.length;
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < rewards.length; i++) {
      final reward = rewards[i];
      paint.color = i.isEven ? Colors.orangeAccent : Colors.amber;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * angle,
        angle,
        true,
        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: reward.label,
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final theta = angle * (i + 0.5);
      final offset = Offset(
        center.dx + radius * 0.6 * cos(theta) - textPainter.width / 2,
        center.dy + radius * 0.6 * sin(theta) - textPainter.height / 2,
      );
      textPainter.paint(canvas, offset);

      // 🎯 绘制图标
      if (reward.resolvedIcon != null) {
        final imgOffset = Offset(
          center.dx + radius * 0.35 * cos(theta) - 15,
          center.dy + radius * 0.35 * sin(theta) - 15,
        );

        paintImage(
          canvas: canvas,
          rect: Rect.fromLTWH(imgOffset.dx, imgOffset.dy, 30, 30),
          image: reward.resolvedIcon!,
          fit: BoxFit.contain,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 🎯 根据最终旋转角度，计算转盘中奖的索引
/// - [angle]：最终的转盘旋转角度（弧度）
/// - [count]：扇区总数
/// - [pointerAngle]：指针方向，默认指向上方（-π/2）
/// 返回：中奖扇区的 index（从 0 开始）
class LuckyUtils {
  static int getIndexFromAngle({
    required double angle,
    required int count,
    double pointerAngle = -pi / 2,
  }) {
    final double sectionAngle = 2 * pi / count;
    final double relative = (pointerAngle - angle + 2 * pi) % (2 * pi);
    return (relative / sectionAngle).floor() % count;
  }
}
