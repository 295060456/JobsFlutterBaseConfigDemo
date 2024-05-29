import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/extentions/ex_list.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_rotating_arrow.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

/// 滚动条 TabBar
/*
         CustomScrollbarTabBar(
          titles: ["title1", "title2"],
          urls: [
            "https://d2utx4nptvgikt.cloudfront.net/images/CATE/lobby.webp",
            "https://d2utx4nptvgikt.cloudfront.net/images/CATE/lobby.webp",
          ],
          selIndex: controller.selIndex,
          callback: controller.didSelAction,
        )
* */
class CustomScrollbarTabBar extends StatelessWidget {

  /// Tab标题
  final List<String> titles;
  /// icons
  final List<String> urls;
  /// titles选中下标
  final int selIndex;
  /// 选中回调
  final Function(int)? callback;

  CustomScrollbarTabBar({
    super.key,
    required this.titles,
    required this.selIndex,
    this.urls = const[],
    this.callback
  });

  final colorScheme = ThemeService().colorScheme;
  final titleStyle  = ThemeService().theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);
  final _scrollController = ScrollController();

  // 动画执行
  void _startScaleAnimation(GlobalKey<ScalingWidgetState> key) {
    key.currentState?.startAnimation();
  }

  @override
  Widget build(BuildContext context) {

    return RawScrollbar(
      thumbVisibility: true,
      thumbColor: colorScheme.tertiary,
      thickness: 5,
      radius: const Radius.circular(2.5),
      controller: _scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: <Widget>[
          for(int index = 0; index < titles.length; index++)
            _buildItem(index)
        ].toRow()
            .marginAll(AppValues.smallMargin)
            .backgroundColor(colorScheme.surface)
            .clipRRect(all: AppValues.extraLargeRadius)
            .paddingBottom(AppValues.halfPadding),
      ),
    ).height(54 + 5);
  }

  Widget _buildItem(index) {

    final scalingKey = GlobalKey<ScalingWidgetState>();

    return ScalingWidget(
      key: scalingKey,
      child: <Widget>[
        // icon
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              index == selIndex ? AppThemes.textColorWhite : Colors.transparent,
              BlendMode.srcATop
          ),
          child: CustomNetWorkImage(
            imageUrl: index < urls.length ? urls[index] : "",
            width: AppValues.iconSmallSize,
            height: AppValues.iconSmallSize,
           ),
        ).visibility(index < urls.length),
        const SizedBox(width: AppValues.halfMargin).visibility(index < urls.length),
        // title
        CustomText(titles[index], style: titleStyle)
      ].toRow(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min)
          .marginSymmetric(horizontal: AppValues.largePadding, vertical: AppValues.halfPadding)
          .height(double.infinity)
          .backgroundColor(index == selIndex ?  colorScheme.tertiary : Colors.transparent)
          .clipRRect(all: AppValues.extraLargeRadius)
          .onTap((){
            _startScaleAnimation(scalingKey);
            Future.delayed(const Duration(milliseconds: 50), () {
              if(index != selIndex) {
                callback?.call(index);
              }
           });
        }),
    );
  }

}

