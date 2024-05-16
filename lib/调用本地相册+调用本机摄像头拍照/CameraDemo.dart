import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// 仅调取相机
void main() {
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
      home: const ImagePickerDemo(imageSource: ImageSource.camera),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  final ImageSource imageSource;

  const ImagePickerDemo({super.key, required this.imageSource});

  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: widget.imageSource);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo - Camera'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Take a Photo',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
