import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/button/custom_button.dart';
import 'package:flutter_bet/widget/button/custom_big_main_button.dart';
// import 'package:fire_boot/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrivacyPolicyDialog extends StatefulWidget {
  const CustomPrivacyPolicyDialog(
      {super.key,
        required this.onConfirm,
        required this.onCancel,
        required this.onRegister,
        required this.onPrivater,
        this.themeData});

  //注册协议点击回调
  final VoidCallback onRegister;

  //隐私政策协议点击回调
  final VoidCallback onPrivater;

  //完成流程回调
  final VoidCallback onConfirm;

  //拒绝按钮的回调
  final VoidCallback onCancel;

  final ThemeData? themeData;

  @override
  State<StatefulWidget> createState() => _CustomPrivacyPolicyDialogState();
}

class _CustomPrivacyPolicyDialogState extends State<CustomPrivacyPolicyDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTheme = widget.themeData ?? ThemeService().theme;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: defaultTheme.colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: Text("",
                    textAlign: TextAlign.center,
                    style: defaultTheme.textTheme.titleLarge?.copyWith(
                        color: defaultTheme.colorScheme.inverseSurface)),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Text(
                          "",
                          style: defaultTheme
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppThemes.textColorGrey),
                        ),
                      ],
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            widget.onRegister();
                          },
                          child: Text(
                            "",
                            style:defaultTheme
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                color: defaultTheme
                                    .colorScheme
                                    .primary),
                          ),
                        ),
                        Text("、",
                            style: defaultTheme
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppThemes.textColorGrey)),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            widget.onPrivater();
                          },
                          child: Text(
                            "",
                            style: defaultTheme
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                color: defaultTheme
                                    .colorScheme
                                    .primary),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 1, left: 24, right: 24),
                child: Text(
                    "",
                    textAlign: TextAlign.left,
                    style: defaultTheme
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppThemes.textColorGrey)),
              ),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
              _buildAgreeButton(),
              _buildCancelButton(defaultTheme),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(ThemeData themeData) {
    return CustomButton(
      title: '',
      textColor: AppThemes.textColorGrey,
      alignment: Alignment.center,
      constraints:
      BoxConstraints(minHeight: themeData.buttonTheme.height),
      onTap: () => widget.onCancel(),
    );
  }

  Widget _buildAgreeButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: CustomBigMainButton(
        onTap: (controller) => widget.onConfirm(),
        title: '',
      ),
    );
  }
}

