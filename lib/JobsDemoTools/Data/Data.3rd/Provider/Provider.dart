import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const MyApp(),
    ),
  );
}

// ===================== 🚀 顶层 APP =====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 用 select 精准监听 themeMode
    final isDark = context.select<ThemeModel, bool>((t) => t.isDark);

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}

// ===================== 🏠 首页 =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterModel>().count; // 监听整个模型

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 全演示 Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeModel>().toggleTheme(), // 只读取
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterLabel(),
            Text(
              '$count',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),
            const ConsumerWidgetDemo(),
            const SizedBox(height: 30),
            const SelectWidgetDemo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterModel>().increment(), // 不监听，仅调用方法
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ===================== 📦 模型类 =====================
class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 通知所有监听它的 widget 刷新
  }
}

// 切换主题
class ThemeModel with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

// ===================== 🧱 子组件：Consumer 用法 =====================
class ConsumerWidgetDemo extends StatelessWidget {
  const ConsumerWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            const Text('（通过 Consumer 监听）'),
            Text('当前计数：${model.count}'),
            child ?? const SizedBox(),
          ],
        );
      },
      child: const Text('👶 这个 child 不会重建'),
    );
  }
}

// ===================== 🧱 子组件：select 精准监听 =====================
class SelectWidgetDemo extends StatelessWidget {
  const SelectWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<ThemeModel, bool>((model) => model.isDark);

    return Column(
      children: [
        const Text('（通过 select 监听 isDark）'),
        Text('当前主题：${isDark ? '🌙 暗色' : '☀️ 亮色'}'),
      ],
    );
  }
}

// ===================== 🧱 子组件：显示标签 =====================
class CounterLabel extends StatelessWidget {
  const CounterLabel({super.key});

  @override
  Widget build(BuildContext context) {
    print('CounterLabel rebuild'); // 可用于演示是否重建
    return const Text(
      '你点击了按钮的次数是：',
      style: TextStyle(fontSize: 18),
    );
  }
}
