import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // 定义GlobalKey
  final GlobalKey<_MainPageBottomBarWidgetState> mainPageKey = GlobalKey<_MainPageBottomBarWidgetState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          MainPageBottomBarWidget(key: mainPageKey),
          ElevatedButton(
            onPressed: () {
              // 通过GlobalKey调用实例方法
              mainPageKey.currentState?.dd();
            },
            child: const Text('Call Instance Method'),
          ),
        ],
      ),
    );
  }
}

class MainPageBottomBarWidget extends StatefulWidget {
  const MainPageBottomBarWidget({super.key});

  @override
  _MainPageBottomBarWidgetState createState() => _MainPageBottomBarWidgetState();
}

class _MainPageBottomBarWidgetState extends State<MainPageBottomBarWidget> {
  void dd() {
    debugPrint("sss");
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Main Page Content'),
    );
  }
}
