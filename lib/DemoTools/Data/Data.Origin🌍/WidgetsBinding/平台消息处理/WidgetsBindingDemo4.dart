import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Platform Messages')),
        body: const PlatformMessageDemo(),
      ),
    );
  }
}

class PlatformMessageDemo extends StatefulWidget {
  const PlatformMessageDemo({super.key});

  @override
  _PlatformMessageDemoState createState() => _PlatformMessageDemoState();
}

class _PlatformMessageDemoState extends State<PlatformMessageDemo> {
  static const platform = MethodChannel('com.example.platform/messages');
  String _response = "Waiting for response...";

  @override
  void initState() {
    super.initState();
    _sendMessage();
  }

  Future<void> _sendMessage() async {
    try {
      final String result = await platform.invokeMethod('getPlatformVersion');
      setState(() {
        _response = "Platform version: $result";
      });
    } on PlatformException catch (e) {
      setState(() {
        _response = "Failed to get platform version: ${e.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _response,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
