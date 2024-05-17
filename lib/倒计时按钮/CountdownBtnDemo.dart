import 'package:flutter/material.dart';
import 'CountdownBtn.dart';

void main() {
  runApp(const CountdownBtnDemo());
}

class CountdownBtnDemo extends StatelessWidget {
  const CountdownBtnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('倒计时按钮示例'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountdownBtn(
                textFront: '现在是距离倒计时结束还有：',
                textBack: '请做好准备。',
                isVertical: false,
                duration: 3600, // 1小时
                textStyle: const TextStyle(fontSize: 16),
                autoStart: false, // 点击触发
                timeStep: 2,
                countUp: true,
                initialTime: DateTime.now(),
              ),
              const SizedBox(height: 20),
              CountdownBtn(
                textFront: '现在是距离倒计时结束还有：',
                textBack: '请做好准备。',
                isVertical: true,
                duration: 3600, // 1小时
                textStyle: const TextStyle(fontSize: 16),
                autoStart: true, // 自动触发
                timeStep: 1,
                countUp: true,
                initialTime: DateTime.now(),
              ),
              const SizedBox(height: 20),
              CountdownBtn(
                textFront: '现在是距离倒计时结束还有：',
                textBack: '请做好准备。',
                isVertical: false,
                duration: 3600, // 1小时
                textStyle: const TextStyle(fontSize: 16),
                autoStart: false, // 点击触发
                timeStep: -2,
                countUp: false,
                initialTime: DateTime.now(),
              ),
              const SizedBox(height: 20),
              CountdownBtn(
                textFront: '现在是距离倒计时结束还有：',
                textBack: '请做好准备。',
                isVertical: true,
                duration: 3600, // 1小时
                textStyle: const TextStyle(fontSize: 16),
                autoStart: true, // 自动触发
                timeStep: -1,
                countUp: false,
                initialTime: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
