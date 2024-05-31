import 'package:flutter/material.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';

///权重一行 自定义widget
class CustomRowExpandedWidget extends StatelessWidget {
  const CustomRowExpandedWidget({
    super.key,
    this.expanded,
    required this.children,
    this.leftPadding,
    this.rightPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final List<int>? expanded;
  final List<Widget> children;
  final double? leftPadding;
  final double? rightPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        SizedBox(width: leftPadding),
        ..._buildViews(),
        SizedBox(width: rightPadding),
      ],
    );
  }

  _buildViews() {
    return children
        .asMap()
        .entries
        .map((e) => Expanded(flex: _getExpandFlex(e.key), child: e.value))
        .toList();
  }

  int _getExpandFlex(int index) {
    if (expanded != null && expanded!.isNotEmpty && index < expanded!.length) {
      return expanded![index];
    } else {
      return 1;
    }
  }


}
