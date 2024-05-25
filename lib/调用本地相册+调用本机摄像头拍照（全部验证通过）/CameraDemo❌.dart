import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      // 在Release模式下，将应用控制权交给系统
      exit(1);
    }
  };

  runApp(const CameraDemo());
}

class CameraDemo extends StatelessWidget {
  const CameraDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo - Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagePickerDemo(),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File? _media;
  String? _lastSavedMediaPath;
  final picker = ImagePicker();
  VideoPlayerController? _videoController;

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _media = File(pickedFile.path);
        _disposeVideoController();
        debugPrint('Image selected: ${_media!.path}');
      });
    } else {
      _showSnackBar('No image selected.');
    }
  }

  Future<void> getVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _media = File(pickedFile.path);
        debugPrint('Video selected: ${_media!.path}');
      });
      await _copyToAppDirectory(_media!);
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
    if (_media!.path.endsWith('.mp4') || _media!.path.endsWith('.mov')) {
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

  Future<void> _copyToAppDirectory(File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = file.path.split('/').last;
    final newFile = File('${appDir.path}/$fileName');
    await file.copy(newFile.path);
    debugPrint('File copied to: ${newFile.path}');
    _initializeVideoController(newFile);
  }

  void _initializeVideoController(File file) async {
    if (!file.existsSync()) {
      debugPrint('File does not exist: ${file.path}');
      _showSnackBar('File does not exist: ${file.path}');
      return;
    }
    _disposeVideoController();
    try {
      const String videoPath = '/var/mobile/Containers/Data/Application/C7CEA48F-26B6-461F-A118-985D220826BA/Documents/image_picker_14CE8DD3-77CC-4222-A853-F7F281B8C0B8-7217-00000249980499CD73833523874__250E5310-DBD1-4EBE-80C9-49B1B7D514AA.MOV';
      VideoPlayerController.file(File(videoPath));
      _videoController = VideoPlayerController.file(file)
        ..addListener(() {
          if (_videoController!.value.hasError) {
            _showSnackBar('Error playing video: ${_videoController!.value.errorDescription}');
            debugPrint('Error playing video: ${_videoController!.value.errorDescription}');
          }
        })
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
          _videoController!.play();
          debugPrint('Video controller initialized');
        }).catchError((error) {
          _showSnackBar('Error initializing video: $error');
          debugPrint('Error initializing video controller: $error');
        });
    } catch (error) {
      _showSnackBar('Error: $error');
      debugPrint('Error initializing video controller: $error');
    }
  }

  void _disposeVideoController() {
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo - Camera'),
      ),
      body: Center(
        child: _media == null
            ? const Text('No media selected.')
            : _media!.path.endsWith('.mp4') || _media!.path.endsWith('.mov')
                ? _videoController != null && _videoController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
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
            tooltip: 'Take a Photo',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: getVideo,
            tooltip: 'Record a Video',
            child: const Icon(Icons.videocam),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: saveToGallery,
            tooltip: 'Save to Gallery',
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
