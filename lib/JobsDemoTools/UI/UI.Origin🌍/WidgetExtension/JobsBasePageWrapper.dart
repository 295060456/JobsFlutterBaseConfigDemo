import 'package:flutter/material.dart';

// 使用示例
// @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       Text('标题'),
//       TextField(),
//     ],
//   ).withBasePage(context, appBar: AppBar(title: Text('首页')));
// }

/// 含 AppBar 支持
extension JobsBasePageWrapper on Widget {
  Widget withBasePage(BuildContext context, {PreferredSizeWidget? appBar}) {
    final bottomInset = View.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: this,
          ),
        ),
      ),
    );
  }
}
