import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsCupertinoRunner.dart';// 公共测试器路径
// void main() => runApp(const JobsCupertinoRunner(CustomOverlayDemo(),title:'XXX'));
// void main() {
//   runApp(JobsCupertinoRunner.builder(
//     title: 'Flutter Bloc Demo',
//     builder: (ctx) {
//       return BlocProvider(
//         create: (_) => CounterBloc(),
//         child: const CounterPage(),
//       );
//     },
//   ));
// }

/// 通用组件测试器(iOS 风格)，自动生成可运行页面
/// 通用组件测试器：支持 child 和 builder 两种形式
class JobsCupertinoRunner extends StatelessWidget {
  final Widget Function(BuildContext context)? builder;
  final Widget? child;
  final String? title;

  const JobsCupertinoRunner._internal({
    this.builder,
    this.child,
    this.title,
    super.key,
  });

  /// 原始构造函数：兼容 const + 旧用法
  /// :（冒号）	表示进入初始化列表，或者重定向构造函数
  const JobsCupertinoRunner(Widget child, {String? title, Key? key})
      : this._internal(child: child, title: title, key: key);

  /// 支持 builder 模式（需要 context）
  /// factory 构造函数可以不直接创建新对象，而是返回一个已有的对象、子类对象，或进行条件逻辑判断后返回不同对象。
  factory JobsCupertinoRunner.builder({
    required Widget Function(BuildContext context) builder,
    String? title,
    Key? key,
  }) =>
      JobsCupertinoRunner._internal(builder: builder, title: title, key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(1125, 2436),
        minTextAdapt: true,
        child: child ?? const SizedBox(), // 👈 关键：这个 child 会传给 builder 的第二个参数
        builder: (context, _) => CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: const CupertinoThemeData(
            primaryColor: CupertinoColors.activeBlue,
            textTheme: CupertinoTextThemeData(
              navTitleTextStyle: TextStyle(fontSize: 20),
            ),
          ),
          home: Builder(
            builder: (ctx) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle:
                    Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
              ),
              child: SafeArea(
                child: child ?? Text('请传入 child 或 builder'.tr),
              ),
            ),
          ),
        ),
      );
}
