import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(
    Phoenix(
      child: const PhoenixAppDemo(),
    ),
  );
}

class PhoenixAppDemo extends StatelessWidget {
  const PhoenixAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Phoenix 示例')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🌀 Phoenix 提供全局热重启能力\n'
                '• 调用 Phoenix.rebirth(context)\n'
                '• 整个 App 状态树将重新启动',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Phoenix.rebirth(context),
                child: const Text('重启 App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
