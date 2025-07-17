// lib/pages/app_level_containers/cupertino_app_demo.dart
import 'package:flutter/cupertino.dart';

void main() => runApp(const CupertinoAppDemo());

class CupertinoAppDemo extends StatelessWidget {
  const CupertinoAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,

      /// 是否显示右上角的红色 DEBUG 标识（横幅）
      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoApp 示例'),
      ),
      child: const Center(
        child: Text('这是 CupertinoApp 的结构\n'
            '🍎 CupertinoApp 是 iOS 风格的应用入口\n'
            '• 用于构建 iOS 原生风格页面结构\n'
            '• 自动使用 Cupertino 样式导航与动画\n'
            '• 与 MaterialApp 互斥，只能用一个'),
      ),
    );
  }
}
