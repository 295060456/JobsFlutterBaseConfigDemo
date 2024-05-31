import 'package:flutter/material.dart';

import '../../services/theme/theme_service.dart';
import '../button/custom_icon_button.dart';
import '../custom_back_icon_button.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  // final List<CustomIconButton>? actions;
  final List<Widget>? actions;
  final bool showLeading;
  final CustomIconButton? leading;
  final Widget? titleView;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? titleSpacing;
  final AppBarTheme? appBarTheme;
  final double? elevation;
  final double? height;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    super.key,
    this.appBarTitleText,
    this.actions,
    this.showLeading = true,
    this.leading,
    this.titleView,
    this.backgroundColor,
    this.leadingWidth,
    this.titleSpacing,
    this.appBarTheme,
    this.elevation,
    this.height,
    this.onBackTap,
  });

  @override
  Size get preferredSize {
    return height != null ? Size(AppBar().preferredSize.width, height!) : AppBar().preferredSize;
  }

  @override
  Widget build(BuildContext context) {
    final theme = appBarTheme ?? ThemeService().theme.appBarTheme;
    return SizedBox(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      child: AppBar(
        iconTheme: theme.iconTheme,
        backgroundColor: backgroundColor ?? theme.backgroundColor,
        leading: showLeading == false
            ? Container()
            : (leading ??
                CustomBackIconButton(
                  onTap: onBackTap,
                )),
        leadingWidth: showLeading == false ? 0 : leadingWidth,
        elevation: appBarTheme?.elevation ?? elevation,
        shadowColor: appBarTheme?.shadowColor,
        actions: actions,
        titleSpacing: titleSpacing,
        centerTitle: true,
        title: titleView ??
            Text(
              appBarTitleText ?? '',
              style: theme.titleTextStyle?.copyWith(fontWeight: FontWeight.w600),
            ),
      ),
    );
  }
}
