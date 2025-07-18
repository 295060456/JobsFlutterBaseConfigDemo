import 'package:flutter/widgets.dart';

void main() => runApp(const WidgetsAppDemo());

class WidgetsAppDemo extends StatelessWidget {
  const WidgetsAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFFFFFFFF),
      builder: (context, child) => const Center(
        child: Text(
          '🧱 WidgetsApp 是最基础的容器\n'
          '• 没有主题、没有 Material 组件\n'
          '• 通常作为 MaterialApp 的底层实现',
          textAlign: TextAlign.center,
        ),
      ),
      onGenerateRoute: (settings) => PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Placeholder(),
      ),
    );
  }
}
