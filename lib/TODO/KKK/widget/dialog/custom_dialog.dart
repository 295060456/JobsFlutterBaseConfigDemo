// 弹出底部sheet
import 'package:flutter_bet/generated/l10n.dart' as l10n;
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/button/custom_big_ghost_button.dart';
import 'package:flutter_bet/widget/button/custom_big_main_button.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'custom_safe_dialog.dart';

Future<bool?> showCustomDialog<T>({
  String title = '', // 标题
  String content = '',
  String confirm = '',
  String cancel = '',
  required BuildContext context,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  bool showCancel = true,
  ColorScheme? colorScheme,
}) async {
  bool? result;
  final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
  await CustomSafeDialog.show<T>(
      context: context,
      tag: 'CustomDialog',
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.only(
              left: AppValues.defaultPadding, right: AppValues.defaultPadding),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container()),
              CustomDialog(
                title: title,
                content: content,
                colorScheme: defaultColorScheme,
                cancel: cancel,
                confirm: confirm,
                showCancel: showCancel,
                onConfirm: () {
                  result = true;
                },
                onCancel: () {
                  result = false;
                },
              ),
              Expanded(child: Container()),
            ],
          ),
        );
      });
  return result;
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final ColorScheme? colorScheme;
  final String? cancel;
  final String? confirm;
  final bool showCancel;
  final Function onConfirm;
  final Function onCancel;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.content,
      this.colorScheme,
      this.cancel,
      this.confirm,
      required this.showCancel,
      required this.onConfirm,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      padding: const EdgeInsets.only(
          left: AppValues.defaultPadding,
          right: AppValues.defaultPadding,
          top: 30,
          bottom: 18),
      decoration: BoxDecoration(
        color: defaultColorScheme.background,
        borderRadius: BorderRadius.circular(AppValues.smallRadius),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: ThemeService()
                .theme
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            style: ThemeService()
                .theme
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme?.onSurface),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              showCancel
                  ? Expanded(
                      child: CustomBigGhostButton(
                        title: cancel,
                        onTap: () {
                          onCancel();
                          RouteUtil.popView();
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
              Visibility(
                visible: showCancel,
                child: const SizedBox(
                  width: AppValues.defaultPadding,
                ),
              ),
              Expanded(
                child: CustomBigMainButton(
                  onTap: (controller) {
                    onConfirm();
                    RouteUtil.popView();
                  },
                  title: confirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
