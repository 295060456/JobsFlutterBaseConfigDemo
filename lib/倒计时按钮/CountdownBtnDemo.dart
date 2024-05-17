import 'package:flutter/material.dart';
import 'CountdownBtn.dart' as countdown_btn;

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
              // 水平布局、点击触发、步长2(计时器模式)
              countdown_btn.CountdownBtn(
                textFront: '现在已经进行：',
                textBack: '请做好准备。',
                isVertical: false,
                duration: 3600, // 1小时
                textStyle: const TextStyle(fontSize: 16),
                autoStart: false, // 点击触发
                timeStep: 0.5,
                initialTime: DateTime.now(),
              ),
              const SizedBox(height: 20),
              // 垂直布局、自动触发、步长1(计时器模式)
              // countdown_btn.CountdownBtn(
              //   textFront: '现在已经进行：',
              //   textBack: '请做好准备。',
              //   isVertical: true,
              //   duration: 3600, // 1小时
              //   textStyle: const TextStyle(fontSize: 16),
              //   autoStart: true, // 自动触发
              //   timeStep: 1,
              //   initialTime: DateTime.now(),
              // ),
              const SizedBox(height: 20),
              // 水平布局、点击触发、步长-2(倒计时模式)
              // countdown_btn.CountdownBtn(
              //   textFront: '现在距离倒计时结束还有：',
              //   textBack: '请做好准备。',
              //   isVertical: false,
              //   duration: 3600, // 1小时
              //   textStyle: const TextStyle(fontSize: 16),
              //   autoStart: false, // 点击触发
              //   timeStep: -2,
              //   initialTime: DateTime.now(),
              // ),
              const SizedBox(height: 20),
              // 垂直布局、自动触发、步长-1(倒计时模式)
              // countdown_btn.CountdownBtn(
              //   textFront: '现在距离倒计时结束还有：',
              //   textBack: '请做好准备。',
              //   isVertical: true,
              //   duration: 3600, // 1小时
              //   textStyle: const TextStyle(fontSize: 16),
              //   autoStart: true, // 自动触发
              //   timeStep: -1,
              //   initialTime: DateTime.now(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
