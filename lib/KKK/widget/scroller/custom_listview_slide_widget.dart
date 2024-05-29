import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:get/get.dart';

import 'custom_adaptive_scrollbar.dart';

/// 可左右滑动的listView , 并带有title
class CustomListViewSlideWidget extends StatefulWidget {
  final double? listWidthMax;
  final bool isVerticalScrollEnable;

  //列表的 头部title view
  final Widget Function(BuildContext context)? titleBuilder;

  // final Widget? itemWidget;//列表的item view
  final Widget? Function(BuildContext context, int index)? itemBuilder;
  final Widget? Function(BuildContext context, ScrollController hCtrl, ScrollController vCtrl)?
      childBulider; //与itemBuilder， 只能一个
  final int? itemCount; //列表数量
  final ScrollController? vCtrl;
  final Color? underColor;

  const CustomListViewSlideWidget({
    super.key,
    this.listWidthMax,
    this.isVerticalScrollEnable = true,
    this.titleBuilder,
    this.itemBuilder,
    this.itemCount,
    this.childBulider,
    this.vCtrl,
    this.underColor,
  });

  @override
  State<CustomListViewSlideWidget> createState() => _CustomListViewSlideWidgetState();
}

class _CustomListViewSlideWidgetState extends State<CustomListViewSlideWidget> {
  ///窗口列表可是最大框宽度
  final double windowListWidthMax = Get.width * 1.4;

  late ScrollController _hCtrl;

  late ScrollController _vCtrl;

  @override
  void initState() {
    super.initState();
    _hCtrl = ScrollController();
    _vCtrl = widget.vCtrl ?? ScrollController();
  }

  @override
  void dispose() {
    _hCtrl.dispose();
    _vCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScrollListView(context);
    // return _buildScrollListView2();
  }

  ///AdaptiveScrollbar 第三方 方案
  _buildScrollListView(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // log("左右滑动CustomListViewSlideWidget...constraints...$constraints");
        // log("左右滑动CustomListViewSlideWidget...maxHeight...${constraints.maxHeight}");
        return CustomAdaptiveScrollbar(
          controller: _hCtrl,
          width: 10,
          // sliderHeight: 10,
          // underColor: ThemeService().theme.scaffoldBackgroundColor,
          // underColor: Colors.red,
          underDecoration: BoxDecoration(
              color: widget.underColor ?? ThemeService().theme.colorScheme.surface,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          sliderDefaultColor: Colors.transparent,
          // width: windowListWidthMax,
          position: ScrollbarPosition.bottom,
          // underSpacing: EdgeInsets.only(bottom: constraints.maxHeight),
          sliderChild: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF557086),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const SizedBox(height: 10)),
          child: SingleChildScrollView(
            controller: _hCtrl,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: widget.listWidthMax ?? windowListWidthMax,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  Container(
                      child: widget.titleBuilder != null
                          ? widget.titleBuilder!(context)
                          : Container()),
                  Expanded(child: _buildListView(context)),
                ],
              ),
              // child: Column(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     SizedBox(
              //         height: 50,
              //         child: widget.titleBuilder != null
              //             ? widget.titleBuilder!(context)
              //             : Container()),
              //     Expanded(
              //       child: Scrollbar(
              //         key: const Key('debuggerCodeViewHorizontalScrollbarKey222'),
              //         thumbVisibility: true,
              //         controller: _vCtrl,
              //         thickness: 10,
              //         child: ListView.builder(
              //             primary: false,
              //             physics: BouncingScrollPhysics(),
              //             // controller: ScrollController(),
              //             itemCount: widget.itemCount,
              //             shrinkWrap: true,
              //             scrollDirection: Axis.vertical,
              //             itemBuilder: (context, index) {
              //               return widget.itemBuilder(context, index);
              //             }),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        );
      },
    );
  }

  ///如果itemBuilder 有实现，则优选使用它，没有的话就使用 自定义listBuilder；
  ///因为考虑到有上下拉组件 所以添加一个listBuilder；
  _buildListView(BuildContext context) {
    return widget.itemBuilder != null
        ? ListView.builder(
            primary: false,
            padding: EdgeInsets.zero,
            physics: widget.isVerticalScrollEnable
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            // controller: ScrollController(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.itemCount,
            controller: _vCtrl,
            itemBuilder: (context, index) {
              return widget.itemBuilder!(context, index);
            })
        : widget.childBulider!(context, _hCtrl, _vCtrl);
  }

  ///原生的Scrollbar 方案
  @Deprecated("过期代码， 旧代码")
  _buildScrollListView2() {
    return LayoutBuilder(
      builder: (_, constraints) {
        // log("左右滑动CustomListViewSlideWidget...constraints...$constraints");
        // log("左右滑动CustomListViewSlideWidget...maxHeight...${constraints.maxHeight}");
        return ConstrainedBox(
          // height: constraints.maxHeight-100,
          constraints: BoxConstraints.tightFor(height: constraints.maxHeight),
          child: Scrollbar(
            thumbVisibility: true,
            // trackVisibility: true,
            thickness: 10,
            interactive: true,
            controller: _hCtrl,
            // notificationPredicate: (ScrollNotification notification) => notification.depth == 1,
            key: const Key('debuggerCodeViewVerticalScrollbarKey'),
            child: SizedBox(
              height: constraints.maxHeight,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: _hCtrl,
                primary: false,
                child: SizedBox(
                  width: widget.listWidthMax ?? windowListWidthMax,
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          height: 50,
                          child: widget.titleBuilder != null
                              ? widget.titleBuilder!(context)
                              : Container()),
                      Expanded(
                        child: Scrollbar(
                          key: const Key('debuggerCodeViewHorizontalScrollbarKey222'),
                          thumbVisibility: true,
                          controller: _vCtrl,
                          thickness: 10,
                          child: ListView.builder(
                              primary: false,
                              physics: widget.isVerticalScrollEnable
                                  ? const BouncingScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                              // controller: ScrollController(),
                              itemCount: widget.itemCount,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return widget.itemBuilder!(context, index);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
