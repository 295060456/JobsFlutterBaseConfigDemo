import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 创建一个 CounterModel 类，表示计数器的状态
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  // 增加计数器的方法
  void increment() {
    _count++;
    notifyListeners(); // 通知监听器状态已更改
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 ChangeNotifierProvider 将 CounterModel 注入到整个应用程序中
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MaterialApp(
        title: 'Provider Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        // 使用 Consumer 来获取 CounterModel，并在构建 UI 时订阅它的状态
        child: Consumer<CounterModel>(
          builder: (context, counter, child) => Text(
            'Count: ${counter.count}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 通过 Provider.of<CounterModel>(context, listen: false) 获取 CounterModel 实例
          Provider.of<CounterModel>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

