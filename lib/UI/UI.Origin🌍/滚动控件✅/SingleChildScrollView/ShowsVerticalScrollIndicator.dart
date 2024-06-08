import 'package:flutter/material.dart';
/// SingleChildScrollView类似于iOS的showsVerticalScrollIndicator效果
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScrollViewWithScrollbar(),
    );
  }
}

class ScrollViewWithScrollbar extends StatefulWidget {
  const ScrollViewWithScrollbar({super.key});

  @override
  _ScrollViewWithScrollbarState createState() => _ScrollViewWithScrollbarState();
}

class _ScrollViewWithScrollbarState extends State<ScrollViewWithScrollbar> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll View with Scrollbar'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true, // 始终显示滚动条
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: List.generate(50, (index) => ListTile(title: Text('Item $index'))),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
