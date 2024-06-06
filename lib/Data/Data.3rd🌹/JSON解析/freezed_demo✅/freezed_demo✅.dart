import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import './采用freezed的序列化文件/video_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freezed JSON Parsing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<VideoItem> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/Jsons/data.json');
      final parsed = json.decode(jsonString);
      final videoList = VideoList.fromJson(parsed);
      setState(() {
        _items = videoList.list;
      });
    } catch (e) {
      debugPrint('Error loading local JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed JSON Parsing Demo'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.head ?? ''),
            ),
            title: Text(item.title ?? 'No Title'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('昵称: ${item.nick_name ?? 'Unknown'}'),
                Text('播放次数: ${item.play_count ?? '0'}'),
                Text('点赞次数: ${item.agree_num ?? '0'}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_circle_fill),
              onPressed: () {
                // 播放视频的逻辑，例如跳转到视频播放页面
              },
            ),
          );
        },
      ),
    );
  }
}
