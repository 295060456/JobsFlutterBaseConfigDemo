import 'package:flutter/material.dart';
// import '../../../TestBase/JobsComponentRunner.dart'; // 公共测试器路径

/// 通用组件测试器，自动生成可运行页面
class JobsComponentRunner extends StatelessWidget {
  final Widget child;
  final String? title;

  const JobsComponentRunner(this.child, {super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title ?? child.runtimeType.toString())),
        body: Center(child: child),
      ),
    );
  }
}
