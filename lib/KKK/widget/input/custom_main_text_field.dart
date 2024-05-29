import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_error_tips_text.dart.dart';
import 'package:flutter_bet/widget/custom_icon.dart';
import 'package:flutter_bet/widget/custom_text.dart';

import 'custom_text_field.dart';

class CustomMainTextField extends StatelessWidget {
  final BoxDecoration? decoration;

  final double height;
  final bool showError;
  final ColorScheme? colorScheme;
  final bool isShowDeleteBtn;
  final String hintText;
  final CustomInputCallBack? inputCallBack;
  final CustomInputCompletionCallBack? inputCompletionCallBack;
  final CustomGetFocusNodeCallBack? getFocusNodeCallBack;
  final String text;
  final TextStyle? style;
  final String? title;
  final Color? titleTextColor;
  final Color? hintColor;
  final Color? textColor;
  final String? errorText;
  final bool isPwd; // 是否是密码，默认不是
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool? required;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool showArrow;
  final EdgeInsetsGeometry? contentPadding;
  final int maxLines;
  final int maxLength;
  final bool isChecked;
  final bool isEmoji;
  final bool isHighlight;
  final bool isCursorEnd;
  final bool isRemoveHint;
  final bool isUpdatePsdOffset;
  final GestureTapCallback? onTap;
  final TextStyle? hintStyle;

  const CustomMainTextField({
    super.key,
    this.text = '',
    this.style,
    this.height = AppValues.defaultTextHeight,
    this.showError = false,
    this.colorScheme,
    this.isShowDeleteBtn = false,
    this.hintText = '',
    this.inputCallBack,
    this.inputCompletionCallBack,
    this.getFocusNodeCallBack,
    this.isPwd = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.title,
    this.errorText,
    this.required = false,
    this.titleTextColor,
    this.hintColor = AppThemes.walletHintColor,
    this.textColor,
    this.showArrow = false,
    this.contentPadding,
    this.maxLines = 1,
    this.maxLength = 30,
    this.isChecked = false,
    this.isEmoji = false,
    this.isHighlight = false,
    this.onTap,
    this.isCursorEnd = true,
    this.isRemoveHint = false,
    this.isUpdatePsdOffset = false,
    this.hintStyle,
    this.decoration,
  }); //是否显示红色边框
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = colorScheme ?? ThemeService().colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title?.isNotEmpty == true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppValues.smallPadding),
            child: isChecked
                ? Row(
                    children: [
                      CustomText(
                        title ?? '',
                        style: ThemeService().textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: titleTextColor ?? CustomTextColorStyle.normal.value),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(
                          color: AppThemes.chatRoomButtonColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: CustomText(S.current.random_text_725,
                              style: ThemeService()
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black)),
                        ),
                      )
                    ],
                  )
                : RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      TextSpan(
                        text: title ?? '',
                        style: ThemeService().textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: titleTextColor ?? CustomTextColorStyle.normal.value),
                      ),
                      TextSpan(
                          text: required == true ? '*' : '',
                          style: ThemeService().textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppThemes.reverseStateColor)),
                    ])),
          ),
        ),
        _buildTextFiled(defaultColorScheme),
        Visibility(
            visible: showError == true && errorText?.isNotEmpty == true,
            child: Padding(
              padding: const EdgeInsets.only(top: AppValues.smallPadding),
              child: CustomErrorTipsText(
                text: errorText ?? '',
              ),
            )),
      ],
    );
  }

  Widget _buildTextFiled(ColorScheme colorScheme) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: decoration ??
              BoxDecoration(
                color: colorScheme.surface,
                border: Border.all(color: _getBorderColor(colorScheme), width: 2),
                borderRadius: BorderRadius.circular(AppValues.smallRadius),
              ),
          child: CustomTextField(
            hintStyle: hintStyle,
            isRemoveHint: isRemoveHint,
            isCursorEnd: isCursorEnd,
            text: text,
            style: style,
            hintColor: hintColor,
            textColor: textColor,
            isShowDeleteBtn: isShowDeleteBtn,
            maxLines: maxLines,
            maxLength: maxLength,
            contentPadding: contentPadding ??
                EdgeInsets.only(
                  top: maxLines > 1 ? 6 : 0,
                  bottom: maxLines > 1 ? 6 : 0,
                  left: AppValues.defaultPadding,
                  right: isEmoji ? height - 6 : 0,
                ),
            hintText: hintText,
            inputCompletionCallBack: inputCompletionCallBack,
            getFocusNodeCallBack: getFocusNodeCallBack,
            inputCallBack: inputCallBack,
            keyboardType: keyboardType,
            isPwd: isPwd,
            inputFormatters: inputFormatters,
            enabled: enabled,
            focusNode: focusNode,
            controller: controller,
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: showArrow,
            child: Row(
              children: const [
                Expanded(child: SizedBox.shrink()),
                CustomIcon(asset: 'assets/images/setup/ic_down_arrow.png'),
                SizedBox(
                  width: AppValues.defaultPadding,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Visibility(
              visible: isEmoji,
              child: InkWell(
                  onTap: onTap,
                  child: Container(
                      alignment: Alignment.center,
                      width: height,
                      height: height,
                      // color: Colors.amber,
                      child: Container(
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.only(left: 8,top: 2),
                          width: height - 8,
                          height: height - 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isHighlight ? AppThemes.chatRooCardColor : Colors.transparent,
                          ),
                          child: CustomText('😀',
                              style: ThemeService()
                                  .theme
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: AppValues.fontTileSmallSize)))))),
        ),
      ],
    );
  }

  Color _getBorderColor(ColorScheme colorScheme) {
    return showError == true ? ThemeService().colorScheme.error : colorScheme.tertiary;
  }
}
