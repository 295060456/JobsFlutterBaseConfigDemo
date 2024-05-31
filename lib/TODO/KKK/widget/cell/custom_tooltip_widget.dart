import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///自定义提示小组件，点击模式 或者 长按模式
class CustomTooltipWidget extends StatelessWidget {
  final TooltipTriggerMode? triggerMode; //触摸模式。
  final double? verticalOffset; //偏移
  final Duration? waitDuration; //待显示等待时间
  final Duration? showDuration; //提示框显示的持续时间
  final bool? preferBelow; //false ，提示信息就会显示在上方。
  final bool isShow; //是否显示
  final String? message; //当""时，不显示 和 richMessage 不要同时使用
  final InlineSpan? richMessage; //
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final TooltipTriggeredCallback? onTriggered; //回调

  const CustomTooltipWidget({
    super.key,
    this.triggerMode = TooltipTriggerMode.tap,
    this.verticalOffset = 15,
    this.waitDuration = const Duration(milliseconds: 100),
    this.showDuration = const Duration(milliseconds: 1500),
    this.preferBelow = false,
    this.isShow = true,
    this.message,
    this.richMessage,
    this.padding,
    this.decoration,
    required this.child,
    this.onTriggered,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      // message: message != null && message!.isNotEmpty && isShow ? message : "",
      message: isShow ? message : '',
      richMessage: isShow ? richMessage : null,
      preferBelow: preferBelow,
      waitDuration: waitDuration,
      showDuration: showDuration,
      triggerMode: TooltipTriggerMode.tap,
      verticalOffset: verticalOffset,
      padding: padding,
      decoration: decoration,
      onTriggered: onTriggered,
      child: child,
    );
  }
}
