import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

/// 自定义Text builder
typedef TextBuilder = Widget Function(BuildContext context);

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    Key? key,
    this.width,
    this.height,
    this.scale,
    this.padding,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.text = "1", //1作为不需要特别数据 直接展示暂无数据
    this.imgPath = "assets/images/data_empty.png",
    this.colorScheme,
    this.textBuilder,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? scale; //在给定 宽高 的基础上 进行缩放倍数
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final String? text;
  final String? imgPath;
  final ColorScheme? colorScheme;
  final TextBuilder? textBuilder;

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return Center(
      child: Container(
          width: width,
          height: height,
          alignment: alignment,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgPath!,
                fit: BoxFit.contain,
                scale: scale ?? 2,
              ),
              const SizedBox(height: AppValues.halfPadding),
              textBuilder != null
                  ? Builder(
                      builder: (context) {
                        return textBuilder!(context);
                      },
                    )
                  : Text(
                      "${text == "1" ? S.current.random_text_721 : text}",
                      style: ThemeService()
                          .theme
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: defaultColorScheme.onSurface),
                    ),
            ],
          )),
    );
  }
}
