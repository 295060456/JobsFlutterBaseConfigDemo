import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
// import '../../TestBase/JobsComponentRunner.dart'; // 公共测试器路径
// void main() => runApp(const JobsComponentRunner(CustomOverlayDemo(),title:'XXX'));

/// 通用组件测试器，自动生成可运行页面
class JobsComponentRunner extends StatelessWidget {
  final Widget child;
  final String? title;

  const JobsComponentRunner(this.child, {super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          // 使用 Lato 字体
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title ?? child.runtimeType.toString())),
        body: Center(child: child),
      ),
    );
  }
}
