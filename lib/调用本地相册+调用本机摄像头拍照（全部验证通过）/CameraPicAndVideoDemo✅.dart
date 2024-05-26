import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path/path.dart' as path;

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
      _showSnackBar('No video selected.');
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
    if (_media!.path.endsWith('.mp4')) {
      success = await GallerySaver.saveVideo(_media!.path, albumName: 'Jobs') ?? false;
    } else if (_media!.path.endsWith('.mov')) {
      success = await GallerySaver.saveVideo(_media!.path, albumName: 'Jobs') ?? false;
    } else {
      success = await GallerySaver.saveImage(_media!.path, albumName: 'Jobs') ?? false;
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
    final mp4FilePath = path.join(appDir.path, '${path.basenameWithoutExtension(movFile.path)}.mp4');
    final mp4File = File(mp4FilePath);

    await FFmpegKit.execute('-i ${movFile.path} -vcodec h264 -acodec aac -strict -2 ${mp4File.path}');

    if (await mp4File.exists()) {
      return mp4File;
    } else {
      _showSnackBar('Failed to convert video.');
      return null;
    }
  }

  void _initializeVideoPlayer(File file) {
    _controller?.dispose();
    _controller = VideoPlayerController.file(file)
      ..addListener(() {
        if (_controller?.value.hasError == true) {
          _showSnackBar('Error playing video: ${_controller?.value.errorDescription}');
        }
      })
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      }).catchError((error) {
        _showSnackBar('Error initializing video: $error');
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
        title: const Text('Video Player Demo'),
      ),
      body: Center(
              child: _media == null
            ? const Text('No image selected.')
            : Image.file(_media!),
        // child: _controller == null
        //     ? const Text('No video selected.')
        //     : _controller!.value.isInitialized
        //         ? AspectRatio(
        //             aspectRatio: _controller!.value.aspectRatio,
        //             child: VideoPlayer(_controller!),
        //           )
        //         : const CircularProgressIndicator(),
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
