import 'package:flutter/widgets.dart';

///通过混入的方式实现缓存不是很优雅，因为必须更改 Page 的代码，有侵入性。
///网上开发者自定义了一个KeepAliveWrapper组件，只需要使用 KeepAliveWrapper包裹需要缓存的组件就可以了。
// KeepAliveWrapper(child:Page( text: '$i')
class CustomKeepAliveWrapper extends StatefulWidget {
  const CustomKeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  KeepAliveWrapperState createState() => KeepAliveWrapperState();
}

class KeepAliveWrapperState extends State<CustomKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant CustomKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
