import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';


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
        _initializeVideoController(_media!);
      });
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

  void _initializeVideoController(File file) {
    _disposeVideoController();
    _videoController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {});
        _videoController!.play();
      }).catchError((error) {
        _showSnackBar('Error loading video: $error');
      });
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
            : _media!.path.endsWith('.mp4')
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
