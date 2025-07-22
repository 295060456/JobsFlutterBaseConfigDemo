import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/utils.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';

// 使用第三方库 flutter_fortune_wheel 实现抽奖轮盘
// 优点：更快实现、高级动画、插件维护良好。
// 缺点：自定义性较差、不支持完全自由布局。

void main() => runApp(const JobsMaterialRunner(ThirdPartyWheelPage(),
    title: '抽奖轮盘@flutter_fortune_wheel'));

class ThirdPartyWheelPage extends StatefulWidget {
  const ThirdPartyWheelPage({super.key});
  @override
  State<ThirdPartyWheelPage> createState() => _ThirdPartyWheelPageState();
}

class _ThirdPartyWheelPageState extends State<ThirdPartyWheelPage> {
  final List<String> items = [
    '一等奖'.tr,
    '二等奖'.tr,
    '三等奖'.tr,
    '谢谢参与'.tr,
    '四等奖'.tr,
    '五等奖'.tr
  ];
  final StreamController<int> controller = StreamController<int>();

  void _spin() {
    final selected = Random().nextInt(items.length);
    controller.add(selected);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第三方转盘抽奖'.tr)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FortuneWheel(
            selected: controller.stream,
            items: [
              for (var it in items) FortuneItem(child: Text(it)),
            ],
            onAnimationEnd: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('抽中了：${items[await controller.stream.last]}'.tr)),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _spin, child: Text('点击抽奖'.tr)),
        ],
      ),
    );
  }
}
