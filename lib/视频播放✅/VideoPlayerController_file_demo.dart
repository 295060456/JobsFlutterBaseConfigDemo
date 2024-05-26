import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

// VideoPlayerController_file_demo.dart

// 视频资源位于项目跟目录下的：
// assets/Video/AppLaunchAssets/appLaunch_welcome.mp4

// dependencies:
//   flutter:
//     sdk: flutter
//   video_player: 

void main() {
  runApp(const VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = _loadVideo();
  }

  Future<void> _loadVideo() async {
    // 将 assets 中的视频文件复制到应用文档目录
    final ByteData data = await rootBundle.load('assets/Video/AppLaunchAssets/appLaunch_welcome.mp4');
    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File(path.join(tempDir.path, 'welcome_video.mp4'));
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

    // 使用复制后的文件路径初始化 VideoPlayerController
    _controller = VideoPlayerController.file(tempFile);
    await _controller!.initialize();
    setState(() {});
    _controller!.play();
    _controller!.setLooping(true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Demo'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: _controller != null && _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : const Text('Error loading video'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller != null) {
              if (_controller!.value.isPlaying) {
                _controller!.pause();
              } else {
                _controller!.play();
              }
            }
          });
        },
        child: Icon(
          _controller != null && _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
