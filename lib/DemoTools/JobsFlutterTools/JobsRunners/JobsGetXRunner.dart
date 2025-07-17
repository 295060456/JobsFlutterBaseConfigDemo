import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:jobs_flutter_base_config/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart'; // 公共测试器路径
// void main() =>
//     runApp(const JobsGetRunner(Text('GetX 测试组件'), title: '简单测试'));
// void main() {
//   runApp(JobsGetRunner.builder(
//     title: 'Obx 测试',
//     builder: (ctx) => Center(
//       child: Obx(() => Text('当前值：${controller.count}')),
//     ),
//   ));
// }
/// 通用组件测试器（GetX 版本）
/// 支持 child 和 builder 两种方式
class JobsGetRunner extends StatelessWidget {
  final Widget Function(BuildContext context)? builder;
  final Widget? child;
  final String? title;

  const JobsGetRunner._internal({
    this.builder,
    this.child,
    this.title,
    super.key,
  });

  /// 原始构造函数（支持 const）
  const JobsGetRunner(Widget child, {String? title, Key? key})
      : this._internal(child: child, title: title, key: key);

  /// 支持 builder 构造方式
  factory JobsGetRunner.builder({
    required Widget Function(BuildContext context) builder,
    String? title,
    Key? key,
  }) {
    return JobsGetRunner._internal(builder: builder, title: title, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title ?? 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
          ),
          body: builder != null ? builder!(ctx) : child!,
        ),
      ),
    );
  }
}
