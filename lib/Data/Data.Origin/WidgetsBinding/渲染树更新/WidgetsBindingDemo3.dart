import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Render Tree Update')),
        body: const RenderUpdateDemo(),
      ),
    );
  }
}

class RenderUpdateDemo extends StatefulWidget {
  const RenderUpdateDemo({super.key});

  @override
  _RenderUpdateDemoState createState() => _RenderUpdateDemoState();
}

class _RenderUpdateDemoState extends State<RenderUpdateDemo> {
  String _message = "Initial State";

  void _updateUI() {
    setState(() {
      _message = "UI Updated!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _message,
            style: const TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: _updateUI,
            child: const Text('Update UI'),
          ),
        ],
      ),
    );
  }
}
