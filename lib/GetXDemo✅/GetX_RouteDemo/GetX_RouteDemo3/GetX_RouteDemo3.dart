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
    return GetMaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
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
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => DetailPage(message: message),
        ),
      );
    }
  }
}
