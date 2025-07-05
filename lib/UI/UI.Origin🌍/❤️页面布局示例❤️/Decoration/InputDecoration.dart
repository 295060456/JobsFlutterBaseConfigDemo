import 'package:flutter/material.dart';
import '../../../TestBase/JobsComponentRunner.dart'; // 公共测试器路径

void main() =>
    runApp(const JobsComponentRunner(MyApp(), title: 'InputDecoration Demo'));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your name',
            hintText: 'Name',
            icon: Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}
