import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // 定义选项卡的数量
        child: Scaffold(
          appBar: AppBar(
            title: const Text('UnderlineTabIndicator Demo'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Colors.white),
                insets: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Content of Tab 1')),
              Center(child: Text('Content of Tab 2')),
            ],
          ),
        ),
      ),
    );
  }
}
