import 'package:flutter/material.dart';
import 'Pages/CupertinoAppDemo.dart' show CupertinoAppDemo;
import 'Pages/DevicePreviewAppDemo.dart' show DevicePreviewAppDemo;
import 'Pages/EasyLocalizationAppDemo.dart' show EasyLocalizationAppDemo;
import 'Pages/GetMaterialAppDemo.dart' show GetMaterialAppDemo;
import 'Pages/MaterialAppDemo.dart' show MaterialAppDemo;
import 'Pages/PhoenixAppDemo.dart' show PhoenixAppDemo;
import 'Pages/WidgetsAppDemo.dart' show WidgetsAppDemo;

void main() => runApp(const RootApp());

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 是否显示右上角的红色 DEBUG 标识（横幅）
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('🧱 主结构（App 级别容器）'),
        ListTile(
          title: const Text('MaterialApp 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MaterialAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('GetMaterialApp 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const GetMaterialAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('CupertinoApp 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CupertinoAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('WidgetsApp 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WidgetsAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('EasyLocalization 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EasyLocalizationAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('Phoenix 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PhoenixAppDemo()),
          ),
        ),
        ListTile(
          title: const Text('DevicePreview 示例'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DevicePreviewAppDemo()),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
