import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/extension/button_theme_data_extension.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../custom_bet_loading_icon.dart';
import 'custom_button.dart';
import 'custom_button_controller.dart';
import 'custom_button_style.dart';

/// 页面中的主按钮,支持动态设置背景颜色，置灰
///
/// 和[CustomSmallMainButton]相比，该按钮是占据父节点分配的最大可用空间，按钮文案居中对齐
///
/// 按钮高度固定等于[themeData.height]
///
/// 按钮是圆角矩形的形状，不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// 大的 提交 按钮
/// CustomBigMainButtonWidget(
///    title: '提交',
/// )
///
/// CustomBigMainButtonWidget(
///   title: '提交',
///   isEnable: false,
///   onTap: () {
///     CustomToast.show('点击了主按钮', context);
///   },
/// ),

/// 其他按钮如下：
///  * [CustomBigGhostButton], 大主色调的幽灵按钮
///  * [CustomBigOutlineButton], 大边框按钮
class CustomBigMainButton extends StatefulWidget {
  ///按钮显示文案,默认'确认'
  final String? title;

  ///是否可用,true 使用主题色，false置灰
  final bool? isEnable;

  ///是否可用,true 体育投注，false其他按钮
  ///主要是动画样式变了
  final bool isSportBet;

  final bool loading;

  ///点击回调
  final Function(CustomButtonController btnController)? onTap;

  ///默认父布局可用空间,优先级
  ///[maxWidth] > [double.infinity]
  final double? maxWidth;

  final FontWeight  fontWeight ;

  /// 按钮圆角大小,优先级:
  /// [borderRadius] > [themeData.buttonTheme.borderRadius]
  final BorderRadiusGeometry? borderRadius;

  ///主题管理器
  final ButtonThemeData? themeData;

  final CustomButtonController? controller;

  final CustomButtonColorStyle colorStyle;

  final Color? textColor;

  const CustomBigMainButton(
      {super.key,
      this.title,
      this.isEnable = true,
      this.isSportBet = false,
      this.loading = false,
      this.onTap,
      this.maxWidth,
      this.themeData,
      this.borderRadius,
      this.colorStyle = CustomButtonColorStyle.normal,
      this.textColor,
      this.controller, this.fontWeight = FontWeight.w500});

  @override
  State<StatefulWidget> createState() => _CustomBigMainButton();
}

class _CustomBigMainButton extends State<CustomBigMainButton> {
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
          _animationWidget = widget.isSportBet
              ? const CustomBetLoadingIcon()
              : SpinKitThreeBounce(
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
    if (widget.loading) {
      _animationWidget = widget.isSportBet
              ? const CustomBetLoadingIcon()
              : SpinKitThreeBounce(
                  size: 16,
                  color: CustomTextColorStyle.white.value?.withOpacity(0.7),
                  duration: const Duration(milliseconds: 1200),
                );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTheme = widget.themeData ?? ThemeService().theme.buttonTheme;
    return CustomButton(
      fontWeight: widget.fontWeight,
      constraints: BoxConstraints.tightFor(
          width: widget.maxWidth ?? double.infinity, height: defaultTheme.height),
      alignment: Alignment.center,
      isEnable: widget.isEnable,
      title: widget.title,
      borderRadius: widget.borderRadius ?? defaultTheme.borderRadius,
      backgroundColor: widget.colorStyle.backgroundColor,
      disableBackgroundColor: widget.colorStyle.backgroundColor.withOpacity(0.7),
      onTap: () {
        if (widget.onTap != null) widget.onTap!(_controller);
      },
      textColor: widget.textColor ?? widget.colorStyle.textColor,
      disableTextColor: widget.colorStyle.textColor.withOpacity(0.7),
      child: _animationWidget,
    );
  }

  @override
  void dispose() {
    _controller.removeListener();
    super.dispose();
  }
}
