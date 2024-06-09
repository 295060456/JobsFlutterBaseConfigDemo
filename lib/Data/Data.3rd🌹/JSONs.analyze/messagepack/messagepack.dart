import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import 'response_data.dart';

void testParseData(String jsonData) {
  try {
    final Map<String, dynamic> data = jsonDecode(jsonData) as Map<String, dynamic>;
    print('Parsed JSON data: $data');

    final responseData = ResponseData.fromJson(data);
    print('Parsed ResponseData: ${responseData.toJson()}');
    // Do something with responseData
  } catch (e) {
    print('Error parsing JSON data: $e');
  }
}

void main() {

  testParseData(rootBundle.loadString('assets/Jsons/data.json') as String);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VideoListScreen(),
    );
  }
}

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  ResponseData? _responseData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // _loadVideos();
  }

  Future<void> _loadVideos() async {
    try {
      final jsonString = await rootBundle.loadString('assets/Jsons/data.json');
      final jsonResponse = json.decode(jsonString);
      final responseData = ResponseData.fromJson(jsonResponse);

      // 将 JSON 数据转换为 MessagePack 格式
      final packedData = serialize(responseData.toJson());

      // 解析 MessagePack 数据
      final unpackedData = deserialize(packedData);

      // 确保解包后的数据转换为正确的类型
      final Map<String, dynamic> unpackedMapData = (unpackedData as Map).map(
        (key, value) => MapEntry(key.toString(), value),
      );

      setState(() {
        _responseData = ResponseData.fromJson(unpackedMapData);
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _responseData?.list.length ?? 0,
              itemBuilder: (context, index) {
                final video = _responseData!.list[index];
                return ListTile(
                  leading: Image.network(video.head),
                  title: Text(video.nickName),
                  subtitle: Text(video.title),
                );
              },
            ),
    );
  }
}
