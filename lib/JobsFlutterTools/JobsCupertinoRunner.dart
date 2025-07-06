import 'package:flutter/cupertino.dart';
// import 'package:jobs_flutter_base_config/TestBase/JobsMaterialRunner.dart';// 公共测试器路径
// void main() => runApp(const JobsMaterialRunner(CustomOverlayDemo(),title:'XXX'));

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
  const JobsCupertinoRunner(Widget child, {String? title, Key? key})
      : this._internal(child: child, title: title, key: key);

  /// 支持 builder 模式（需要 context）
  /// factory 构造函数可以不直接创建新对象，而是返回一个已有的对象、子类对象，或进行条件逻辑判断后返回不同对象。
  factory JobsCupertinoRunner.builder({
    required Widget Function(BuildContext context) builder,
    String? title,
    Key? key,
  }) {
    return JobsCupertinoRunner._internal(
        builder: builder, title: title, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
            middle: Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
          ),
          child: SafeArea(
            child: builder != null ? builder!(ctx) : child!,
          ),
        ),
      ),
    );
  }
}
