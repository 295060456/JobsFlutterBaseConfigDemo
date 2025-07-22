import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';// 公共测试器路径
// void main() =>
// runApp(JobsGetRunner(const PageB(), navigatorObservers:[routeObserver],title: '路由变化的监听测试'));
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
  final Widget? Function(BuildContext context)? builder;
  final Bindings? bindings;
  final List<NavigatorObserver>? navigatorObservers;
  final Widget? child;
  final String? title;

  const JobsGetRunner._internal({
    this.builder,
    this.bindings,
    this.navigatorObservers,
    this.child,
    this.title,
    super.key,
  });

  /// 原始构造函数（支持 const）
  const JobsGetRunner(Widget? child,
      {Widget? Function(BuildContext context)? builder,
      Bindings? bindings,
      List<NavigatorObserver>? navigatorObservers,
      String? title,
      Key? key})
      : this._internal(
            child: child,
            builder: builder,
            navigatorObservers: navigatorObservers,
            bindings: bindings,
            title: title,
            key: key);

  /// 支持 builder 构造方式
  factory JobsGetRunner.builder({
    required Widget Function(BuildContext context) builder,
    Bindings? bindings,
    List<NavigatorObserver>? navigatorObservers,
    Widget? child,
    String? title,
    Key? key,
  }) =>
      JobsGetRunner._internal(
          child: child,
          builder: builder,
          navigatorObservers: navigatorObservers,
          bindings: bindings,
          title: title,
          key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      builder: (context, _) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: title ?? 'GetX Demo'.tr,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialBinding: bindings,
            navigatorObservers: navigatorObservers ?? [],
            home: Builder(
              builder: (ctx) => Scaffold(
                appBar: AppBar(
                  title: Text(
                      title ?? (child?.runtimeType.toString() ?? 'Builder'.tr)),
                ),
                body: builder != null
                    ? builder!(ctx)
                    : child ?? Text('请传入 child 或 builder'.tr),
              ),
            ),
          ));
}
