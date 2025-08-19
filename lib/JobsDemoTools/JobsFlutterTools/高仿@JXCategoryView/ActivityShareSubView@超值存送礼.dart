import 'package:flutter/material.dart';

/// 超值存送礼@2
class CategoryListPage_2 extends StatefulWidget {
  final String title;
  final int index;

  const CategoryListPage_2({required this.title, required this.index});

  @override
  State<CategoryListPage_2> createState() => _CategoryListPage_2State();
}

class _CategoryListPage_2State extends State<CategoryListPage_2>
    with AutomaticKeepAliveClientMixin {
  final List<String> _items = List.generate(30, (i) => 'Item #$i');

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Text("超值存送礼",
        style: TextStyle(fontSize: 15, color: Color(0xFF333333)));
  }
}
