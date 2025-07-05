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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.orange),
        textTheme: GoogleFonts.latoTextTheme(
          // 使用 Lato 字体
          Theme.of(context).textTheme,
        ),
        // textTheme:const TextTheme(
        //   bodyLarge: TextStyle(color: Colors.black87, fontSize: 18),
        //   bodyMedium: TextStyle(color: Colors.black54, fontSize: 16),
        //   headlineLarge: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 这里使用 backgroundColor
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title ?? child.runtimeType.toString())),
        body: Center(child: child),
      ),
    );
  }
}
