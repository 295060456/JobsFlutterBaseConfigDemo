import 'package:flutter/material.dart';
import 'A_Widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OtherWidget(),
    );
  }
}

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Widget'),
      ),
      body: Center(
        child: const A_Widget().buildTextWidget(), // 调用 BettingCasinoMyBetListView 中的方法
      ),
    );
  }
}
