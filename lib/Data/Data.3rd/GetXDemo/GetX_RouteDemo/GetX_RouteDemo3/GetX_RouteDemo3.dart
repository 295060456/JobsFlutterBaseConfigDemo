import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 创建一个全局的 GlobalKey<NavigatorState>
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp 本质上是 MaterialApp 的增强版，它依然使用的是 Flutter 官方的导航系统（Navigator）
    return GetMaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        // AppBar 的背景色	✅ 会自动变蓝色
        // FloatingActionButton 默认背景色	✅ 会变成主颜色
        // Switch / Checkbox 激活状态颜色	✅ 会变成主颜色
        // TextField 获得焦点时下划线颜色	✅ 会变成主颜色
        // ProgressIndicator	✅ 默认用主颜色
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey, // 使用全局的navigatorKey
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 调用 pushToView 方法导航到 DetailPage
            RegisterBinding.pushToView(
              'detail',
              arguments: {'message': 'Hello from HomePage!'},
              onBack: (result) {
                log('👉 DetailPage 返回了：$result' as num);
                Get.snackbar('返回值', '$result');
              },
            );
          },
          child: const Text('Go to Detail Page'),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String message;
  const DetailPage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Message from HomePage:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 关闭当前页面，并传回数据给 HomePage
                // of 是一个 静态方法（通常写在类中），用于从 Widget 树中向上查找最近的某个类型的父 Widget，并返回其状态或实例。
                Navigator.of(context).pop('🌟 我是从 DetailPage 返回的值');
              },
              child: const Text('点我返回并传值'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterBinding {
  static void pushToView(
    String pagName,
    // 使用 {} 将参数包裹起来表示这些参数是可选的，也称为命名参数。
    // 与位置参数不同，命名参数可以按照任意顺序传递，并且可以有默认值。
    {
    dynamic arguments,
    bool offAll = false,
    bool offLast = false,
    bool notRepeat = true,
    ValueChanged<dynamic>? onBack,
  }) {
    // 这里模拟导航到 DetailPage，并传递参数
    if (pagName == 'detail') {
      String message = arguments != null ? arguments['message'] : '';
      // 导航到 DetailPage
      // 这是典型的 Flutter 原生导航，而不是 GetX 的 Get.to()
      // 只要在 Scaffold 里用了 AppBar，系统会自动帮你加上返回键（←），前提是该页面是通过 push 方式打开的（也就是有“返回历史”）。
      navigatorKey.currentState!
          .push(
        MaterialPageRoute(
          builder: (context) => DetailPage(message: message),
        ),
      )
          .then((result) {
        // then 是 Future 的回调方法，它会在 Future 执行完毕后调用，用来处理异步操作的返回结果。
        if (onBack != null) {
          onBack(result);
        }
      });
      // GetX平替
      // Get.to(() => DetailPage(message: message))!.then((result) {
      //   print('返回值是：$result');
      // });
    }
  }
}
