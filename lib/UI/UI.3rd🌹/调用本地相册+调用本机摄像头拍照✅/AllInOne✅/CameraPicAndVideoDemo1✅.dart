import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_compress/video_compress.dart';
import 'package:jobs_flutter_base_config/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart'; // 公共测试器路径

void main() => runApp(const JobsMaterialRunner(
    VideoPlayerScreen(imageSource: ImageSource.camera),
    title: '拍照.录像.存相册'));

class VideoPlayerScreen extends StatefulWidget {
  final ImageSource imageSource;
  const VideoPlayerScreen({super.key, required this.imageSource});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final picker = ImagePicker();
  File? _media;
  String? _lastSavedMediaPath;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    VideoCompress.setLogLevel(0); // 关闭日志输出
  }

  /// 判断是否是视频
  bool isVideo(String path) {
    final ext = path.toLowerCase();
    return ext.endsWith('.mp4') || ext.endsWith('.mov');
  }

  /// 拍照
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: widget.imageSource);
    if (pickedFile != null) {
      setState(() {
        _media = File(pickedFile.path);
      });
      _controller?.dispose();
      _controller = null;
    } else {
      _showSnackBar('还没选择资源');
    }
  }

  /// 录像并压缩
  Future<void> getVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      final movFile = File(pickedFile.path);
      final mp4File = await _convertMovToMp4(movFile);
      if (mp4File != null) {
        setState(() {
          _media = mp4File;
        });
        _initializeVideoPlayer(mp4File);
      }
    } else {
      _showSnackBar('还没有选择视频资源...');
    }
  }

  /// 压缩 MOV 为 MP4
  Future<File?> _convertMovToMp4(File movFile) async {
    try {
      final info = await VideoCompress.compressVideo(
        movFile.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
      );

      if (info != null && info.file != null) {
        return info.file;
      } else {
        _showSnackBar('视频压缩失败...');
        return null;
      }
    } catch (e) {
      _showSnackBar('压缩出错: $e');
      return null;
    }
  }

  /// 初始化视频播放器
  void _initializeVideoPlayer(File file) {
    _controller?.dispose();
    _controller = VideoPlayerController.file(file)
      ..addListener(() {
        if (_controller!.value.hasError) {
          _showSnackBar('播放视频错误: ${_controller!.value.errorDescription}');
        }
      })
      ..setLooping(true)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _controller?.play();
      }).catchError((error) {
        _showSnackBar('初始化视频错误: $error');
      });
  }

  /// 保存到相册
  Future<void> saveToGallery() async {
    if (_media == null) {
      _showSnackBar('没有什么需要保存的...');
      return;
    }
    if (_media!.path == _lastSavedMediaPath) {
      _showSnackBar('已保存到相册');
      return;
    }

    bool success = false;
    final filename = 'Jobs_${DateTime.now().millisecondsSinceEpoch}';

    try {
      if (isVideo(_media!.path)) {
        final result =
            await ImageGallerySaver.saveFile(_media!.path, name: filename);
        success = result['isSuccess'] == true;
      } else {
        final bytes = await _media!.readAsBytes();
        final result = await ImageGallerySaver.saveImage(bytes, name: filename);
        success = result['isSuccess'] == true;
      }
    } catch (_) {
      success = false;
    }

    if (success) {
      HapticFeedback.mediumImpact(); // ✅ 震动反馈
      _lastSavedMediaPath = _media!.path;
      _showSnackBar('已保存到相册');
    } else {
      _showSnackBar('保存失败');
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _controller?.dispose();
    VideoCompress.dispose();
    super.dispose();
  }

  /// UI 渲染
  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_media == null) {
      content = const Text('没有资源被选择...');
    } else if (isVideo(_media!.path)) {
      if (_controller == null || !_controller!.value.isInitialized) {
        content = const CircularProgressIndicator();
      } else {
        content = AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        );
      }
    } else {
      content = Image.file(_media!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('拍照.录像.存相册'),
      ),
      body: Center(child: content),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'camera',
            onPressed: getImage,
            tooltip: '拍照',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'video',
            onPressed: getVideo,
            tooltip: '录像',
            child: const Icon(Icons.videocam),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'save',
            onPressed: saveToGallery,
            tooltip: '保存到相册',
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
