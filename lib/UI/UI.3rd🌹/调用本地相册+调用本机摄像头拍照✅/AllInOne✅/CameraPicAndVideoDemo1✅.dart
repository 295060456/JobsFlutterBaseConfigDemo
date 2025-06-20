import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path/path.dart' as path;

// 跳转系统相机，进行录像或者拍照，且显示拍摄的结果
// 可以对拍摄的结果进行保存在本地相册（相册名：Jobs）

// 真机运行如果出现空白页面的解决方案：
// 方案1、在工程根目录下执行 flutter run --release 或者
// 方案2、通过 flutter devices 拿到设备id，然后 flutter run -d 设备ID。比如
// flutter run lib/调用本地相册+调用本机摄像头拍照（全部验证通过）/CameraDemo2.dart -d 00008110-000625583EE3801E

// 权限问题：Flutter代码不配置设备权限。配置权限需要进入特定的代码里面，按照设备所属的代码规范进行配置。比如：
// iOS进入`info.plist`里面进行配置
// Android通常只涉及两个主要文件：`AndroidManifest.xml` 和 `build.gradle`
void main() {
  runApp(const VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '拍照.录像.存相册',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoPlayerScreen(imageSource: ImageSource.camera),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final ImageSource imageSource;
  const VideoPlayerScreen({super.key, required this.imageSource});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  final picker = ImagePicker();
  File? _media;
  String? _lastSavedMediaPath;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: widget.imageSource);
    setState(() {
      if (pickedFile != null) {
        _media = File(pickedFile.path);
        _controller?.dispose();
        _controller = null;
      } else {
        debugPrint('还没选择资源');
      }
    });
  }

  Future<void> getVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      final File movFile = File(pickedFile.path);
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
    final file = File(_media!.path);
    final filename = 'Jobs_${DateTime.now().millisecondsSinceEpoch}';

    try {
      if (_media!.path.endsWith('.mp4') || _media!.path.endsWith('.mov')) {
        final result = await ImageGallerySaver.saveFile(
          file.path,
          name: filename,
        );
        success = result['isSuccess'] == true;
      } else {
        final Uint8List bytes = await file.readAsBytes();
        final result = await ImageGallerySaver.saveImage(
          bytes,
          name: filename,
        );
        success = result['isSuccess'] == true;
      }
    } catch (e) {
      success = false;
    }

    if (success) {
      setState(() {
        _lastSavedMediaPath = _media!.path;
      });
      _showSnackBar('已保存到相册');
    } else {
      _showSnackBar('保存失败');
    }
  }

  Future<File?> _convertMovToMp4(File movFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final mp4FilePath = path.join(
        appDir.path, '${path.basenameWithoutExtension(movFile.path)}.mp4');
    final mp4File = File(mp4FilePath);

    await FFmpegKit.execute(
        '-i ${movFile.path} -vcodec h264 -acodec aac -strict -2 ${mp4File.path}');

    if (await mp4File.exists()) {
      return mp4File;
    } else {
      _showSnackBar('视频转码失败...');
      return null;
    }
  }

  void _initializeVideoPlayer(File file) {
    _controller?.dispose();
    _controller = VideoPlayerController.file(file)
      ..addListener(() {
        if (_controller?.value.hasError == true) {
          _showSnackBar('播放视频错误: ${_controller?.value.errorDescription}');
        }
      })
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      }).catchError((error) {
        _showSnackBar('初始化视频错误: $error');
      });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拍照.录像.存相册'),
      ),
      body: Center(
        child: _media == null
            ? const Text('没有资源被选择...')
            : _media!.path.endsWith('.mp4')
                ? _controller == null
                    ? const CircularProgressIndicator()
                    : _controller!.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          )
                        : const CircularProgressIndicator()
                : Image.file(_media!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: getImage,
            tooltip: '拍照',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: getVideo,
            tooltip: '录像',
            child: const Icon(Icons.videocam),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: saveToGallery,
            tooltip: '保存到相册',
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
