import 'dart:async';
import 'package:flutter/material.dart';

class PopConfirmWrapper extends StatelessWidget {
  final Widget child;
  final String confirmMessage;

  const PopConfirmWrapper({
    super.key,
    required this.child,
    this.confirmMessage = '你确定要离开此页面吗？',
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          Future.microtask(() async {
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('确认返回？'),
                content: Text(confirmMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('确定'),
                  ),
                ],
              ),
            );

            if (shouldPop == true && context.mounted) {
              Navigator.of(context).pop();
            }
          });
        }
      },
      child: child,
    );
  }
}
