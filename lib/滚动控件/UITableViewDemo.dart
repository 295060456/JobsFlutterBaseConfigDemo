import 'package:flutter/material.dart';
// 演示了类似于iOS.UITableView的效果： ListView + 自定义Cell + 点击Cell跳转到DetailPage
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TableView'),
      ),
      body: ListView.builder(
        itemCount: 50, // 假设有50个项目
        itemBuilder: (BuildContext context, int index) {
          // 返回自定义的单元格
          return MyCell(
            index: index,
            onTap: () {
              // 点击单元格时，跳转到DetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyCell extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const MyCell({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // 自定义单元格的高度
    double cellHeight = 100.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cellHeight,
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item $index',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Subtitle $index',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detail for Item $index',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 点击返回按钮，返回到ListView页面
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
