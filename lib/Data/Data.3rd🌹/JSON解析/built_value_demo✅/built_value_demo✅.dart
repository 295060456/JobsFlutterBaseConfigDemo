import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '采用built_value的序列化文件/video_item.dart';
import '采用built_value的序列化文件/serializers.dart';

// dependencies: 
// # 数据处理
//   built_value: # 用于序列化/反序列化数据
//   built_value_generator: # 用于生成序列化/反序列化代码

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Built Value JSON Parsing Demo',
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
      final videoList = serializers.deserializeWith(VideoList.serializer, parsed);
      setState(() {
        _items = videoList?.list.toList() ?? [];
      });
    } catch (e) {
      debugPrint('Error loading local JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Built Value JSON Parsing Demo'),
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
