import 'package:flutter/material.dart';

/// 队长福利@4
class CategoryListPage_4 extends StatefulWidget {
  final String title;
  final int index;

  const CategoryListPage_4({required this.title, required this.index});

  @override
  State<CategoryListPage_4> createState() => _CategoryListPage_4State();
}

class _CategoryListPage_4State extends State<CategoryListPage_4>
    with AutomaticKeepAliveClientMixin {
  final List<String> _items = List.generate(30, (i) => 'Item #$i');

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Text("队长福利",style: TextStyle(fontSize: 15, color: Color(0xFF333333)));
  }
}
