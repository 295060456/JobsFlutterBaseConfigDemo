
import 'package:flutter/material.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';

/// 轮播图-单侧漏出下/上一页风格
/*
*   CustomSideImageCarousel(
        imgUrls: [
          "https://d2utx4nptvgikt.cloudfront.net/banner/zh_CN/1702092305125.webp",
          "https://d2utx4nptvgikt.cloudfront.net/banner/zh_CN/1702092305125.webp",
          "https://d2utx4nptvgikt.cloudfront.net/banner/zh_CN/1702092305125.webp",
          "https://d2utx4nptvgikt.cloudfront.net/banner/zh_CN/1702092305125.webp",
        ],
        callback: (int index) {
          print("CustomSideImageCarousel: $index");
        }
      ),
* */
class CustomSideImageCarousel extends StatefulWidget {
  /// 图像链接
  final List<String> imgUrls;
  /// 点击回调
  final Function(int)? callback;

  /// 图像高宽比例
  final double aspectRatio;
  /// 侧边漏出图像宽度
  final double sideImageWidth;
  /// 图像之间间隔
  final double spacing;
  /// 圆角
  final double borderRadius;

  const CustomSideImageCarousel({
    super.key,
    required this.imgUrls,
    this.callback,
    this.aspectRatio    = 188.0 / 320.0,
    this.sideImageWidth = 30,
    this.spacing      = 8.0,
    this.borderRadius = 8.0,
  });

  @override
  CustomSideImageCarouselState createState() => CustomSideImageCarouselState();
}

class CustomSideImageCarouselState extends State<CustomSideImageCarousel> {

  final ScrollController _scrollController = ScrollController();
  // 图像宽度
  late double imageWidth;
  // page宽度
  late double itemWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          itemWidth  = constraints.maxWidth - widget.sideImageWidth;
          imageWidth = itemWidth - widget.spacing;
          return NotificationListener<ScrollEndNotification>(
            onNotification: _handleScrollEnd,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  widget.imgUrls.length,
                      (index) => buildCarouselItem(index),
                ),
              ),
            ),
          );
        }
    );
  }

  bool _handleScrollEnd(ScrollEndNotification notification) {
    _handleScroll();
    return false;
  }

  // 用户手势结束翻页处理
  void _handleScroll() {
    final double scrollPosition  = _scrollController.position.pixels;
    final double maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentPage = (scrollPosition / itemWidth).round();
    final isLastItem = currentPage == widget.imgUrls.length - 1;
    final animateToOffset = isLastItem ? maxScrollExtent : (itemWidth + widget.spacing) * currentPage;
    Future.delayed(const Duration(milliseconds: 20), () {
      _scrollController.animateTo(
        animateToOffset,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  // 轮播PageItem
  Widget buildCarouselItem(int index) {
    final isLastItem = index == widget.imgUrls.length - 1;
    return Container(
      width: itemWidth,
      margin: EdgeInsets.only(right: isLastItem ? 0 : widget.spacing),
      child: GestureDetector(
        onTap: (){
          widget.callback?.call(index);
        },
        child: CustomNetWorkImage(
          imageUrl: widget.imgUrls[index],
          fit: BoxFit.fill,
          radius: widget.borderRadius,
          width: double.infinity,
          height: imageWidth * widget.aspectRatio,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}
