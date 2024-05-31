import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/extension/button_theme_data_extension.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../custom_text.dart';
import 'custom_button.dart';
import 'custom_button_controller.dart';

/// 边框 小、次按钮，小灰框，默认按钮确认,支持自定义边框、文字颜色
///
/// 大的边框按钮
/// 该按钮有一个尽可能大的按钮
///
/// 按钮是圆角矩形的形状，只支持设置圆角大小[radius],不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///

class CustomBigOutlineButton extends StatefulWidget{
  /// 按钮显示文案,默认'确认
  final String? title;

  /// 点击的回调
  final Function(CustomButtonController btnController)?onTap;

  // final Function(CustomButtonController btnController)? onAnimeTap;

  ///是否可用，默认为true。false为不可用：置灰、不可点击。
  final bool isEnable;

  /// 边框的颜色，边框颜色，
  final Color? lineColor;

  /// 文字颜色
  final Color? textColor;

  ///圆角,默认[themeData.borderRadius]
  final double? radius;

  ///字体大小
  final double? fontSize;

  /// 文字样式，优先级:
  /// [textStyle] > [textTheme]
  final TextStyle? textStyle;

  /// 配置按钮样式，优先级最低
  final ButtonThemeData? themeData;

  /// 配置按钮文字样式，优先级最低
  final TextTheme? textTheme;

  ///默认父布局可用空间,优先级
  ///[maxWidth] > [double.infinity]
  final double? maxWidth;

  final CustomButtonController? controller;

  const CustomBigOutlineButton(
      {super.key,
      this.title,
      this.onTap,
      this.isEnable = true,
      this.lineColor,
      this.textColor,
      this.radius,
      this.fontSize,
      this.textStyle,
      this.themeData,
      this.textTheme, this.maxWidth,  this.controller});
  @override
  State<StatefulWidget> createState() => _CustomBigOutlineButton();

}

class _CustomBigOutlineButton extends State<CustomBigOutlineButton>{
  Widget? _animationWidget;
  late CustomButtonController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller ?? CustomButtonController();
    _controller.addListener(() {
      if (_controller.isShowAnimation) {
        setState(() {
          _animationWidget = SpinKitThreeBounce(
            size: 16,
            color: CustomTextColorStyle.white.value?.withOpacity(0.7),
            duration: const Duration(milliseconds: 1200),
          );
        });
      } else {
        setState(() {
          _animationWidget = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultThemeData = widget.themeData ?? ThemeService().theme.buttonTheme;

    return CustomButton.outline(
      constraints: BoxConstraints.tightFor(
          width: widget.maxWidth ?? double.infinity, height: defaultThemeData.height),
      borderWith: defaultThemeData.borderWith,
      borderRadius: defaultThemeData.borderRadius,
      title:widget.title,
      disableLineColor: defaultThemeData.disableBorderColor,
      lineColor: widget.lineColor ?? defaultThemeData.borderColor,
      textColor: _getTextColor(defaultThemeData),
      isEnable: widget.isEnable,
      alignment: Alignment.center,
      onTap: (){
    if(widget.onTap != null) widget.onTap!(_controller);
      },
      disableTextColor: defaultThemeData.outLineDisableTextColor,
      child: _animationWidget,
    );
  }

  Color _getTextColor(ButtonThemeData theme) {
    if(ThemeService.instance.isDarkMode) {
      return widget.textColor ?? theme.borderColor;
    }else{
      return widget.textColor ?? theme.colorScheme?.primary ?? Colors.black;
    }

  }
  @override
  void dispose() {
    _controller.removeListener();
    super.dispose();
  }

}