import 'package:flutter_bet/generated/l10n.dart';
import 'dart:developer';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/refresh/widget/custom_footer_widget.dart';

import 'custom_refresh_controller.dart';
import 'widget/cupertino/footer/custom_cupertino_footer.dart';
import 'widget/cupertino/header/custom_cupertino_header.dart';

///上下拉组件， 替换掉[CustomPullToRefresh],这有有点bug
///需要控制 在页面一个数据都没有的情况下 加载更多如何处理逻辑，是不允许加载更多，还是允许， 但page 不能++；
///【注意】：
/// child里面是listview的话 ，需要添加 physics: const NeverScrollableScrollPhysics(),
class CustomRefreshView extends StatelessWidget {
  final Widget child;
  final Widget? childHeader; //额外添加 头部view
  final Widget? childFooter; //额外添加 底部view
  final CustomRefreshController controller;

  ///当 EasyRefresh 构建完成后，触发刷新。
  final bool refreshOnStart;
  final ScrollController? scrollController;

  final bool isCanRefresh;
  final bool isCanLoadMore;

  ///返回 是否刷新成功, 如果为null不可刷新
  final void Function(CustomRefreshController refreshController)? onRefreshAction;

  ///返回，是否还有更多， 如果为null不可更多
  final void Function(CustomRefreshController refreshController)? onLoadMoreAction;

  // final controller = CustomEasyRefreshController(
  //         controlFinishRefresh: true,
  //         controlFinishLoad: true,
  //       );

  const CustomRefreshView({
    super.key,
    required this.controller,
    this.isCanRefresh = true,
    this.isCanLoadMore = true,
    this.onRefreshAction,
    this.onLoadMoreAction,
    this.refreshOnStart = true,
    this.scrollController,
    required this.child,
    this.childHeader,
    this.childFooter,
  });

  CustomRefreshView.controller({
    super.key,
    this.isCanRefresh = true,
    this.isCanLoadMore = true,
    this.onRefreshAction,
    this.onLoadMoreAction,
    this.refreshOnStart = true,
    this.scrollController,
    required this.child,
    this.childHeader,
    this.childFooter,
  }) : controller = CustomRefreshController(
          controlFinishRefresh: true,
          controlFinishLoad: true,
        );

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      clipBehavior: Clip.none,
      //none、hardEdge
      controller: controller,
      refreshOnStart: refreshOnStart,
      scrollController: scrollController,
      triggerAxis: Axis.vertical,
      header: _buildHeader(),
      footer: _buildFooter(),
      onRefresh: isCanRefresh
          ? () async {
              log("开始刷新。。。");
              onRefreshAction!(controller); //自己处理
            }
          : null,
      onLoad: isCanLoadMore
          ? () async {
              log("开始加载更多。。。");
              // onLoadMoreAction!(controller);

              await Future.delayed(const Duration(seconds: 1));
              onLoadMoreAction!(controller); //自己处理
            }
          : null,
      child: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,
        slivers: [
          const HeaderLocator.sliver(),
          SliverToBoxAdapter(child: childHeader),
          SliverToBoxAdapter(child: child),
          SliverToBoxAdapter(child: childFooter),
          const FooterLocator.sliver(),
        ],
      ),
    );
  }

  ///刷新头部组件
  Header? _buildHeader() {
    return const CustomCupertinoHeader(
      position: IndicatorPosition.locator,
      safeArea: false,
    );
    // return const ClassicHeader(
    //   clamping: false,
    //   showMessage: false,
    //   showText: false,
    // ),
    // returnMaterialHeader(
    //   // clamping:true,
    //   // color: Colors.red,
    //   // infiniteOffset: 100,
    // ),
  }

  ///加载更多底部组件
  Footer? _buildFooter() {
    return CustomCupertinoFooter(
      position: IndicatorPosition.locator,
      // safeArea: false,
      emptyWidget: Center(
        child: CustomText(S.current.random_text_727, style: ThemeService().textTheme.bodyMedium),
      ),
    );

    // footer: BezierFooter(),
    // footer: CupertinoFooter(
    //   emptyWidget:
    //       Center(child: CustomText("没有更多数据", style: ThemeService().textTheme.bodyMedium)),
    // ),
    ////设置模版
    // footer: MaterialFooter(
    //   clamping: false,
    //   infiniteOffset: 100,
    //   showBezierBackground: false,
    //   bezierBackgroundAnimation: false,
    //   bezierBackgroundBounce: false,
    //   springRebound: false,
    // ),
    //加载更多组件【CustomFooterWidget】
    // footer: CustomFooterWidget(
    //   clamping: false,
    //   infiniteOffset: 80,
    //   triggerOffset :80,
    //   showBezierBackground: false,
    //   bezierBackgroundAnimation: false,
    //   bezierBackgroundBounce: false,
    //   springRebound: false,
    //   noMoreIcon: Container(
    //     alignment: Alignment.center,
    //     height: 80,//[_kCustomIndicatorSize]
    //     // width: 100,
    //     // color: Colors.cyan,
    //     child: CustomText("没有更多数据", style: ThemeService().textTheme.bodyMedium),
    //   ),
    // ),
    //加载更多组件【ClassicFooter】
    // footer: ClassicFooter(
    //   clamping: false,
    //   showMessage: true,
    //   showText: true,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   dragText: '',
    //   armedText: '',
    //   readyText: '',
    //   processingText: '',
    //   processedText: '',
    //   noMoreText: '没有更多数据',
    //   failedText: '加载失败',
    //   messageText: '',
    //   // textDimension: 200,
    //   // triggerOffset:45,
    //   // infiniteOffset:45,
    //   succeededIcon: Container(height: 20,),
    //   noMoreIcon: Container(height: 20,),
    // ),
  }
}
