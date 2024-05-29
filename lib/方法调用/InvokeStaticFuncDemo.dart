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
      home: AnotherWidget(),
    );
  }
}

class MainPageBottomBarWidget extends StatefulWidget {
  const MainPageBottomBarWidget({super.key});

  @override
  _MainPageBottomBarWidgetState createState() => _MainPageBottomBarWidgetState();
}

class _MainPageBottomBarWidgetState extends State<MainPageBottomBarWidget> {
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

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Widget'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _MainPageBottomBarWidgetState.dd();
          },
          child: const Text('Call Static Method'),
        ),
      ),
    );
  }
}