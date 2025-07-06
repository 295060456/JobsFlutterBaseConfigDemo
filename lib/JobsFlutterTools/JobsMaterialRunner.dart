import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
// import 'package:jobs_flutter_base_config/TestBase/JobsMaterialRunner.dart';// 公共测试器路径
// void main() => runApp(const JobsMaterialRunner(CustomOverlayDemo(),title:'XXX'));

/// 通用组件测试器，自动生成可运行页面
/// 通用组件测试器：支持 child 和 builder 两种形式
class JobsMaterialRunner extends StatelessWidget {
  final Widget Function(BuildContext context)? builder;
  final Widget? child;
  final String? title;

  const JobsMaterialRunner._internal({
    this.builder,
    this.child,
    this.title,
    super.key,
  });

  /// 原始构造函数：兼容 const + 旧用法
  const JobsMaterialRunner(Widget child, {String? title, Key? key})
      : this._internal(child: child, title: title, key: key);

  /// 支持 builder 模式（需要 context）
  factory JobsMaterialRunner.builder({
    required Widget Function(BuildContext context) builder,
    String? title,
    Key? key,
  }) {
    return JobsMaterialRunner._internal(
        builder: builder, title: title, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.orange),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: Builder(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
              title:
                  Text(title ?? (child?.runtimeType.toString() ?? 'Builder'))),
          body: Center(
            child: builder != null ? builder!(ctx) : child!,
          ),
        ),
      ),
    );
  }
}
