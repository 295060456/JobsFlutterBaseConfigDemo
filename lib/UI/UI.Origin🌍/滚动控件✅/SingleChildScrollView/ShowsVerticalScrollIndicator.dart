import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/TestBase/JobsComponentRunner.dart'; // 公共测试器路径

void main() => runApp(const JobsComponentRunner(ScrollViewWithScrollbar(),
    title: 'Scroll View with Scrollbar'));

class ScrollViewWithScrollbar extends StatefulWidget {
  const ScrollViewWithScrollbar({super.key});
  @override
  _ScrollViewWithScrollbarState createState() =>
      _ScrollViewWithScrollbarState();
}

class _ScrollViewWithScrollbarState extends State<ScrollViewWithScrollbar> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: Colors.redAccent,
      controller: _scrollController,
      thumbVisibility: true, // 始终显示滚动条
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: List.generate(
              50, (index) => ListTile(title: Text('Item $index'))),
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
