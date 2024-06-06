import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CustomScrollView Demo',
      home: B(),
    );
  }
}

class A extends StatefulWidget {
  const A({super.key});

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  static void dd() {
    debugPrint("sss");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page Bottom Bar'),
      ),
      body: const Center(
        child: Text('Main Page Content'),
      ),
    );
  }
}

class B extends StatelessWidget {
  const B({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Widget'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _AState.dd();
          },
          child: const Text('Call Static Method'),
        ),
      ),
    );
  }
}