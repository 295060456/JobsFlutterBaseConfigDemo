import 'package:flutter/material.dart';

// ignore: camel_case_types
class A_Widget extends StatelessWidget {
  const A_Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Betting Casino My Bet List View'),
      ),
      body: Center(
        child: buildTextWidget(),
      ),
    );
  }

    Widget buildTextWidget() {
    return const Text(
      'Hello from A_Widget!',
      style: TextStyle(fontSize: 20, color: Colors.blue),
    );
  }
}
