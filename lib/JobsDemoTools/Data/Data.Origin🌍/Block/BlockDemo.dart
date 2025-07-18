import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ACtrl.dart';
// 模拟 Objective-C 中的 Block
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ACtrl aCtrl = Get.put(ACtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locale Callback Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 在外层设置回调函数
                aCtrl.setLocaleCallback(() {
                  return Get.deviceLocale ?? const Locale('en', 'US');
                });
                debugPrint("Callback has been set.");
              },
              child: const Text('Set Locale Callback'),
            ),
            ElevatedButton(
              onPressed: () {
                aCtrl.useLocaleCallback();
                aCtrl.useJobsCallback();
              },
              child: const Text('Use Locale Callback'),
            ),
          ],
        ),
      ),
    );
  }
}
