import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';

void main() => runApp(const JobsMaterialRunner(CustomSingleLayoutApp(),
    title: '📐 CustomSingleChildLayout 示例'));

class CustomSingleLayoutApp extends StatelessWidget {
  const CustomSingleLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey.shade300,
      child: CustomSingleChildLayout(
        delegate: MySingleChildDelegate(),
        child: Container(
          width: 100,
          height: 60,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Hello', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class MySingleChildDelegate extends SingleChildLayoutDelegate {
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // 子组件放在底部中间
    return Offset(
      (size.width - childSize.width) / 2,
      size.height - childSize.height,
    );
  }

  @override
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => false;
}
