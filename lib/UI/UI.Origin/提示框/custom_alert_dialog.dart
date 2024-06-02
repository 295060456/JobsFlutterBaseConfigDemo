import 'package:flutter/material.dart';
import 'dart:async';

class CustomAlertDialog extends StatelessWidget {
  final bool autoDismiss; // 自动消失
  final int autoDismissDuration; // 自动消失持续时间
  final String title; // 标题
  final String subtitle; // 副标题
  final double titleSubtitleSpacing; // 标题和副标题之间的间距
  final TextStyle? titleTextStyle; // 标题文本样式
  final TextStyle? subtitleTextStyle; // 副标题文本样式
  final InlineSpan? titleRichText; // 标题富文本
  final InlineSpan? subtitleRichText; // 副标题富文本
  final bool barrierDismissible; // 点击阴影部分是否可以关闭对话框
  final TextAlign titleTextAlign; // 标题对齐方式
  final TextAlign subtitleTextAlign; // 副标题对齐方式
  final List<Widget>? actions; // 按钮数组
  final List<TextStyle>? actionTextStyles; // 按钮文本样式数组
  final List<VoidCallback>? actionCallbacks; // 按钮点击事件数组
  final Color? backgroundColor; // 背景颜色
  final EdgeInsets contentPadding; // 内容内边距
  final ShapeBorder shape; // 对话框形状

  const CustomAlertDialog({
    super.key,
    this.autoDismiss = false,
    this.autoDismissDuration = 2,
    this.title = '',
    this.subtitle = '',
    this.titleSubtitleSpacing = 8.0,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.titleRichText,
    this.subtitleRichText,
    this.barrierDismissible = false,
    this.titleTextAlign = TextAlign.center,
    this.subtitleTextAlign = TextAlign.center,
    this.actions,
    this.actionTextStyles,
    this.actionCallbacks,
    this.backgroundColor,
    this.contentPadding = const EdgeInsets.all(20),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  });

  static void show(
    BuildContext context, {
    bool autoDismiss = false,
    int autoDismissDuration = 2,
    String title = '',
    String subtitle = '',
    double titleSubtitleSpacing = 8.0,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    InlineSpan? titleRichText,
    InlineSpan? subtitleRichText,
    bool barrierDismissible = false,
    TextAlign titleTextAlign = TextAlign.center,
    TextAlign subtitleTextAlign = TextAlign.center,
    List<Widget>? actions,
    List<TextStyle>? actionTextStyles,
    List<VoidCallback>? actionCallbacks,
    Color? backgroundColor,
    EdgeInsets contentPadding = const EdgeInsets.all(20),
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        if (autoDismiss) {
          Timer(Duration(seconds: autoDismissDuration), () {
            Navigator.of(context).pop();
          });
        }
        return CustomAlertDialog(
          autoDismiss: autoDismiss,
          autoDismissDuration: autoDismissDuration,
          title: title,
          subtitle: subtitle,
          titleSubtitleSpacing: titleSubtitleSpacing,
          titleTextStyle: titleTextStyle,
          subtitleTextStyle: subtitleTextStyle,
          titleRichText: titleRichText,
          subtitleRichText: subtitleRichText,
          barrierDismissible: barrierDismissible,
          titleTextAlign: titleTextAlign,
          subtitleTextAlign: subtitleTextAlign,
          actions: actions,
          actionTextStyles: actionTextStyles,
          actionCallbacks: actionCallbacks,
          backgroundColor: backgroundColor,
          contentPadding: contentPadding,
          shape: shape,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actionButtons = [];
    if (actions != null && actions!.isNotEmpty) {
      for (int i = 0; i < actions!.length; i++) {
        actionButtons.add(
          TextButton(
            onPressed: actionCallbacks != null && i < actionCallbacks!.length
                ? actionCallbacks![i]
                : () {
                    Navigator.of(context).pop();
                  },
            child: DefaultTextStyle(
              style: actionTextStyles != null && i < actionTextStyles!.length
                  ? actionTextStyles![i]
                  : const TextStyle(),
              child: actions![i],
            ),
          ),
        );
      }
    } else {
      actionButtons = [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            '取消',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('确定'),
        ),
      ];
    }

    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.blueAccent.withOpacity(0.8),
      contentPadding: contentPadding,
      shape: shape,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleRichText != null
              ? RichText(text: titleRichText!)
              : Text(
                  title,
                  textAlign: titleTextAlign,
                  style: titleTextStyle ??
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
          SizedBox(height: titleSubtitleSpacing),
          subtitleRichText != null
              ? RichText(text: subtitleRichText!)
              : Text(
                  subtitle,
                  textAlign: subtitleTextAlign,
                  style: subtitleTextStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                ),
        ],
      ),
      actions: actionButtons,
    );
  }
}
