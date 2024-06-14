import 'package:flutter/material.dart';
// 在 Flutter 中，主题（Theme）是一个用于定义应用程序整体视觉外观和感觉的工具。
// 通过主题，你可以定义应用程序的颜色、字体、图标样式等。
// 使用主题可以使你的应用程序在不同页面和组件之间保持一致的视觉风格。

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.orange),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 16),
          headlineLarge: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 这里使用 backgroundColor
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen', style: Theme.of(context).appBarTheme.titleTextStyle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, World!', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Press Me'),
            ),
            const SizedBox(height: 20),
            Text('Secondary Text', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
