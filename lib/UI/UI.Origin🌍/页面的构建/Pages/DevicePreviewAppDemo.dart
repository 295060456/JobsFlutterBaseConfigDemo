import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const DevicePreviewAppDemo(),
    ),
  );
}

class DevicePreviewAppDemo extends StatelessWidget {
  const DevicePreviewAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        appBar: AppBar(title: const Text('DevicePreview 示例')),
        body: const Center(
          child: Text(
            '📱 DevicePreview 可模拟设备\n'
            '• 模拟不同机型、方向、语言\n'
            '• 用于开发期适配与测试',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
