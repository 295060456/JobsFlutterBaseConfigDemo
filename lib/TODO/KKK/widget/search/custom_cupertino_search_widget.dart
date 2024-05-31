import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import '../../generated/l10n.dart';
import '../../services/theme/theme_service.dart';

///自定义搜索组件， ios 风格
class CustomCupertinoSearchWidget extends StatefulWidget {
  final void  Function(String value) onStringCallback;
  final TextEditingController? controller;

  const CustomCupertinoSearchWidget({super.key, required this.onStringCallback, this.controller});

  @override
  State<CustomCupertinoSearchWidget> createState() => _CustomCupertinoSearchWidgetState();
}

class _CustomCupertinoSearchWidgetState extends State<CustomCupertinoSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          // border: Border.all(color: ThemeService().colorScheme.tertiary, width: 2.0),
          // Add a border
          borderRadius: BorderRadius.circular(4),
          // color: ThemeService().colorScheme.surface,
        ),
        child: CupertinoSearchTextField(
          controller: widget.controller,
          style: const TextStyle(
            color: AppThemes.textColorWhite, // Set text color to red
          ),
          backgroundColor: ThemeService().colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
          placeholder: S.current.wallet_search,
          // Use the prefixIcon property to customize the icon.
          prefixIcon: const Icon(
            Icons.search, // You can use any custom icon you want here.
            color: CupertinoColors.systemGrey, // Customize the icon color.
          ),
          // You can also customize the other properties as needed.
          // onSubmitted: (v)=>widget.onStringCallback(v),
          onChanged: (value) {
            //根据用户输入调用。实时调用
            widget.onStringCallback(value);
          },
          onSubmitted: (value) {
            //在键盘提交时调用。

          },
          onSuffixTap: () {
           //默认清除文本。后缀操作是可定制的，以便用户可以使用其他功能覆盖它，这不一定是清除文本。
          },

        ),
      ),
    );
  }
}
