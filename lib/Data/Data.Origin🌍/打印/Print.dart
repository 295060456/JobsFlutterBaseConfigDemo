import 'package:flutter/services.dart';
import 'package:jobs_flutter_base_config/Tools.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'TimeAgo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Flutter 绑定初始化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data Loading Example'),
        ),
        body: FutureBuilder(
          future: _loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(child: Text('Data loaded'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Future<void> _loadData() async {
  try {
    /// 打印一般的字符串
    JobsPrint("AAA");
    /// 打印json字符串
    String jsonString = await rootBundle.loadString('assets/Jsons/data.json');
    JobsPrint(jsonString);
    /// 打印实现了toJson的类
    TimeAgo timeAgo = TimeAgo(123456789098765);
    JobsPrint(timeAgo);
    JobsPrint(timeAgo.yearsAgo);
    JobsPrint(timeAgo.monthsAgo);
    JobsPrint(timeAgo.daysAgo);
    JobsPrint(timeAgo.hoursAgo);
    JobsPrint(timeAgo.minutesAgo);
    JobsPrint(timeAgo.secondsAgo);
    /// 打印Map
    Map<String, int> map = {
    'apple': 1,
    'banana': 2,
    'cherry': 3,
    };
    JobsPrint(map);
    /// 打印Set
    Set<String> fruitsSet = {'apple', 'banana', 'cherry'};
    JobsPrint(fruitsSet);
    /// 打印List
    List<String> fruits = ['Apple', 'Banana', 'Orange'];
    JobsPrint(fruits);
  } catch (e) {
    JobsPrint('Error loading local JSON: $e');
  }
}