import 'package:flutter/material.dart';
// GridView使用演示
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GridView Demo',
      home: GridViewDemo(),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          20,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(itemIndex: index),
                ),
              );
            },
            child: Container(
              color: Colors.teal[100 * (index % 9)],
              child: Center(
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int itemIndex;

  const DetailPage({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page - Item $itemIndex'),
      ),
      body: Center(
        child: Text('Detail Page - Item $itemIndex'),
      ),
    );
  }
}
