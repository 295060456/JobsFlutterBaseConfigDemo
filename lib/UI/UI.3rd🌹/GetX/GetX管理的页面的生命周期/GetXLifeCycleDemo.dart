import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GetX.PageA/views/pageA_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        // 应用程序处于非活动状态
        debugPrint('应用程序处于非活动状态');
        break;
      case AppLifecycleState.paused:
        // 应用程序处于后台
        debugPrint('应用程序处于后台');
        break;
      case AppLifecycleState.resumed:
        // 应用程序处于前台并可交互
        debugPrint('应用程序处于前台并可交互');
        break;
      case AppLifecycleState.detached:
        // 应用程序没有关联的 Flutter 引擎
        debugPrint('应用程序没有关联的 Flutter 引擎');
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageAView(),
    );
  }
}