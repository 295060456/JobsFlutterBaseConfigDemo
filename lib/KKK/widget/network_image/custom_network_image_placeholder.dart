import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:lottie/lottie.dart';

enum NetWorkImagePlaceholderType {
  loading(1, 'loading'),
  error(2, 'error');

  const NetWorkImagePlaceholderType(this.number, this.value);

  final int number;

  final String value;
}

class CustomNetWorkImagePlaceholder extends StatelessWidget {
  CustomNetWorkImagePlaceholder({
    Key? key,
    required this.placeholderType,
    this.borderRadius,
    this.border,
    this.color,
    this.showMsg = true,
  }) : super(key: key);

  final NetWorkImagePlaceholderType placeholderType;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  Color? color;
  final bool showMsg; //默认显示。是否显示 错误提示， 比如小图标 就不要显示错误提示了

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color != null ? this.color : AppThemes.surfaceVariant,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Center(
        child: placeholderType == NetWorkImagePlaceholderType.loading
            ? Lottie.asset(
                'assets/lottie/loading_img_tg.json',
                repeat: true,
                reverse: true,
                animate: true,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                      widthFactor: 0.3, // 子视图宽度占容器宽度的比例
                      alignment: Alignment.center, // 可选，水平居左对齐
                      child: Image.asset(
                        'assets/images/ic_image_loading_error.webp',
                        fit: BoxFit.cover,
                      )),
                  Visibility(
                    visible: showMsg,
                    child: CustomText(
                      S.current.image_load_error,
                      style: TextStyle(color: AppThemes.iconColor, fontSize: 12),
                    ).paddingTop(5),
                  ),
                ],
              ),
      ),
    );
  }
}
