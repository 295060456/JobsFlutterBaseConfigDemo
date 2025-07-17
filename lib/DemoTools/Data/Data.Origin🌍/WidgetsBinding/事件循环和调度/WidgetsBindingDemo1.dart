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
        appBar: AppBar(title: const Text('Event Loop and Scheduling')),
        body: const EventLoopDemo(),
      ),
    );
  }
}

class EventLoopDemo extends StatefulWidget {
  const EventLoopDemo({super.key});

  @override
  _EventLoopDemoState createState() => _EventLoopDemoState();
}

class _EventLoopDemoState extends State<EventLoopDemo> {
  String _message = "Tap to start";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _message = "Event received!";
          });
          // Process a heavy task in the next frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Simulate a delay
            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                _message = "Task completed!";
              });
            });
          });
        },
        child: Text(
          _message,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
