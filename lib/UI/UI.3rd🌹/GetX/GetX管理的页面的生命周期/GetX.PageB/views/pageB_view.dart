import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBView extends GetView {
  const PageBView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Page B'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Page A'),
            ),
          ],
        ),
      ),
    );
  }
}
