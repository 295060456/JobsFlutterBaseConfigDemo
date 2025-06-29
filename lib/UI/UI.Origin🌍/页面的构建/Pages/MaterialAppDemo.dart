import 'package:flutter/material.dart';

void main() => runApp(const MaterialAppDemo());

class MaterialAppDemo extends StatelessWidget {
  const MaterialAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 是否显示右上角的红色 DEBUG 标识（横幅）
      title: 'MaterialApp 示例',
      home: Scaffold(
        appBar: AppBar(title: const Text('MaterialApp 示例')),
        body: const Center(
          child: const Text(
            '✅ MaterialApp 是 Flutter 默认入口容器\n'
            '• 提供主题管理、路由管理、首页指定\n'
            '• 配合 Navigator 实现传统页面跳转\n'
            '• 是 Scaffold、CupertinoApp 等容器的基础',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
