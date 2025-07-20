import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsSafeArea/JobsSmartSafeArea.dart';

/// 不应该在 main() 中用 SafeArea
/// SafeArea 通常应该放在最外层（或接近最外层），且全局只需要用一次
/// 每个页面视图结构中合理包裹 SafeArea，并根据情况启用 top、bottom
/// ⚠️ SafeArea 不能嵌套。如果需要嵌套，则需要使用 MediaQuery.removePadding
/// ⚠️ SafeArea 不能和 Scaffold.resizeToAvoidBottomInset 同时使用，否则会导致布局错误（布局跳动、挤压、底部空间错误等问题）
/// ⚠️ 不能代替键盘避让机制：SafeArea 只考虑系统 UI（如状态栏、刘海、底部 Home 指示器等），不负责键盘避让
/// ⚠️ 对 Dialog/Overlay 等不是在根节点渲染的内容无效
/// ⚠️ CupertinoPageScaffold 自带 SafeArea 行为，但自定义页面仍需要手动处理。
/// ⚠️ 与 AppBar 共用时应只作用于 body,否则会让 AppBar 有额外顶部边距，一般只包裹 Scaffold.body 即可。
/// 参考🤔：https://docs.flutter.dev/ui/adaptive-responsive/safearea-mediaquery
/// 参考🤔：https://docs.flutter.dev/ui/layout

class JobsSafeArea extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;

  const JobsSafeArea({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false, // 避免 SafeArea 冲突
      appBar: appBar,
      body: JobsSmartSafeArea(child: body),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
