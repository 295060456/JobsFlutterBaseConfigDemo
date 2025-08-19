import 'package:flutter/material.dart';
/// 回归包赔@3
class CategoryListPage_3 extends StatefulWidget {
  final String title;
  final int index;

  const CategoryListPage_3({required this.title, required this.index});

  @override
  State<CategoryListPage_3> createState() => _CategoryListPage_3State();
}

class _CategoryListPage_3State extends State<CategoryListPage_3>
    with AutomaticKeepAliveClientMixin {
  final List<String> _items = List.generate(30, (i) => 'Item #$i');

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Text("回归包赔",style: TextStyle(fontSize: 15, color: Color(0xFF333333)));
  }
}
