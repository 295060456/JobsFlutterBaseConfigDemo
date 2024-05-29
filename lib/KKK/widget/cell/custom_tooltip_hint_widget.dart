import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../services/theme/theme_service.dart';
import '../../utils/text_util.dart';
import '../custom_bubble.dart';
import '../custom_text.dart';
import 'custom_tooltip_widget.dart';

///触碰弹出Tooltip, 带箭头。与[CustomTooltipHintWidget] 的区别时 点击提示内容 没有...
///
class CustomTooltipHintWidget extends StatelessWidget {
  const CustomTooltipHintWidget({
    super.key,
    this.content,
    this.contentTip,
    // this.maxLength = 6,
    this.padding,
    this.tipPadding,
    this.style,
    this.styleTip,
    this.fontSize,
    this.isShow,
    this.contentWidget,
  });

  final String? content;
  final String? contentTip; //提示内容
  final EdgeInsets? padding; //显示内容的padding
  final EdgeInsets? tipPadding; //提示内容的padding
  final TextStyle? style; //显示内容的
  final TextStyle? styleTip; //tip显示内容的
  final double? fontSize; //显示字体大小
  // final int maxLength; //超过多少
  final bool? isShow; //是否显示
  final Widget? contentWidget; //自定义显示组件， 优先级最高

  // Text想要展示一行，显示不下展示省略号，通常使用overflow: TextOverflow.ellipsis,
  // 缺陷： 会将长字母或者数字串整体显示省略
  // 例子： 分组YD-YXTJA-2102217-001113123123123123123，可能会显示成：分组YD-…
  // 解决方案：将每个字符串之间插入零宽空格
  //
  // 作者：请你吃div
  // 链接：https://juejin.cn/post/7325459976855928841
  // 来源：稀土掘金
  // 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
  String breakWord(String word) {
    if (word == null || word.isEmpty) {
      return word;
    }
    String breakWord = '';
    word.runes.forEach((element) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    });
    return breakWord;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTooltipWidget(
        isShow: isShow ?? true,
        padding: EdgeInsets.zero,
        verticalOffset: 10,
        decoration: const BoxDecoration(color: Colors.transparent),
        richMessage: WidgetSpan(
          // alignment: PlaceholderAlignment.bottom,
          child: _buildTipContentView(contentTip),
        ),
        child: Container(
          padding: padding ?? const EdgeInsets.all(5),
          child: contentWidget ??
              CustomText(
                content ?? "",
                style: style ??
                    ThemeService().textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize ?? 12,
                        ),
              ),
        ));
  }

  _buildTipContentView(String? content) {
    return UnconstrainedBox(
      child: BubbleView(
        direction: ArrowDirection.bottom,
        arrowWidth: 8,
        arrowHeight: 4,
        borderRadius: const Radius.circular(4.0),
        arrowBasisOffset: 0,
        arrowPeakOffset: 0,
        padding: tipPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CustomText(
          content ?? '',
          style: styleTip??ThemeService().textTheme.labelMedium?.copyWith(
                color: const Color(0xFF13212D),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
