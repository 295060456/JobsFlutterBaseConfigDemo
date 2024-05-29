import 'package:flutter_bet/generated/l10n.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:get/get.dart';

import '../../base/getx/page_state.dart';
import '../../constant/app_themes.dart';
import '../../services/theme/theme_service.dart';
import '../custom_empty_widget.dart';
import '../custom_loading_widget.dart';
import '../network_image/custom_netework_error_view.dart';
import '../network_image/custom_network_image_placeholder.dart';
import '../preload/custom_preload_item_view.dart';
import 'load_state_config.dart';
import 'load_state_config_default.dart';
import 'load_state_config_sport.dart';

///四种视图状态
///根据不同状态来展示不同的视图
///基本逻辑：
///1、读取configType 配置类型；
///2、构造函数有 实现传参的，优先使用；没有在使用configType 里面的参数
typedef PageStateCallback = void Function(PageState pageState);

class CustomLoadStateLayout extends StatefulWidget {
  final PageState configState; //页面状态
  final Widget? configSuccess; //成功视图
  final Widget? configPreLoad; //预加载视图
  // final bool? showPreLoad;
  final List<SliverMultiBoxAdaptorWidget>? successSliverWidget; //成功的滚动视图
  final PageStateCallback? configRetry; //错误事件处理
  final String? emptyMessage;
  final String? emptyImage;
  final bool? showEmptyRetry;
  final String? errorMessage;
  final String? errorImage;
  final bool? showErrorRetry;

  final String? netErrorMessage;
  final String? netErrorImage;
  final bool? showNetErrorRetry;
  final bool loadingCenter;

  // final LoadStateConfig? config; //状态配置
  final LoadStateConfigType configType; //状态配置

  const CustomLoadStateLayout({
    Key? key,
    this.configState = PageState.DEFAULT, //默认为直接显示正文
    this.configSuccess, //成功的布局 （二选一）
    this.configPreLoad, //预加载，占位骨架
    // this.showPreLoad, //是否显示预备加载
    this.successSliverWidget, //成功的滚动布局（二选一）
    this.emptyMessage, //空数据信息展示
    this.emptyImage, //空数据 asset 本地地址
    this.showEmptyRetry = true, //空数据 是否显示重试
    this.errorMessage, //错误的信息展示
    this.errorImage, //错误的图片
    this.showErrorRetry = true, //错误, 是否显示重试
    this.netErrorMessage, //错误的信息展示
    this.netErrorImage, //错误的图片
    this.showNetErrorRetry = true, //错误, 是否显示重试
    this.configRetry, //错误重试的事件
    this.loadingCenter = true, //是否在中心显示
    // LoadStateConfig? configs, //状态配置

    this.configType = LoadStateConfigType.def, //状态配置
  }) : super(key: key);

  @override
  CustomLoadStateLayoutState createState() => CustomLoadStateLayoutState();
}

class CustomLoadStateLayoutState extends State<CustomLoadStateLayout> {
  double imageWidth = 0.0;
  double imageHeight = 0.0;
  late LoadStateConfig config;

  @override
  void initState() {
    super.initState();
    config = factory(widget.configType);
  }

  ///更加type 来选择不同的 多状态配置
  LoadStateConfig factory(LoadStateConfigType type) {
    switch (type) {
      case LoadStateConfigType.def:
        return LoadStateConfigDefault();
      case LoadStateConfigType.sport:
        return LoadStateConfigSport();
      default:
        return LoadStateConfigDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return LayoutBuilder(
      builder: (buildContext, boxConstraints) {
        // log("开发日志：LoadStateLayout...$boxConstraints");
        imageWidth = boxConstraints.maxWidth / 4;
        imageHeight = imageWidth;
        // var hasBoundedHeight = boxConstraints.hasBoundedHeight;
        // var hasInfiniteHeight = boxConstraints.hasInfiniteHeight;
        // var hasTightHeight = boxConstraints.hasTightHeight;
        // log("开发日志：LoadStateLayout...$hasBoundedHeight...$hasInfiniteHeight...$hasTightHeight");
        return _buildWidget;
      },
    );
  }

  _buildChildView() {
    if (widget.successSliverWidget != null) {
      //如果有 successSliverWidget 就使用 Slivers 的方式布局
      return CustomScrollView(
        slivers: _buildSlivers(),
      );
    } else {
      //如果没有有 successSliverWidget 就使用默认布局的方式布局
      return _buildWidget;
    }
  }

  //Slivers的布局
  List<Widget> _buildSlivers() {
    return _buildListWidget;
  }

  ///根据不同状态来显示不同的视图 (默认布局)
  Widget get _buildWidget {
    switch (widget.configState) {
      ///成功时、更新时
      case PageState.SUCCESS:
        return _buildSuccessView;
      case PageState.UPDATED:
        return _buildSuccessView;

      ///不透明loading
      case PageState.LOADING:
        return _loadingOpenView(false);

      ///骨架屏
      case PageState.PRELOAD:
        return _buildPreloadView;
      case PageState.PRELOAD_UPDATED:
        return _buildPreloadView;

      ///空数据时、错误时、服务错误时、
      case PageState.EMPTY:
        return _emptyView;
      case PageState.FAILED:
        return _errorView;
      case PageState.FAILED_SERVER:
        return _errorServerView;

      ///默认配置
      case PageState.DEFAULT:
        return _loadingOpenView(true);
      default:
        return _loadingView;
    }
  }

  ///当成功时、更新时、骨架屏时、骨架并loading时
  Widget get _buildSuccessView {
    if (widget.configState == PageState.SUCCESS) {
      return widget.configSuccess ?? const SizedBox();
    } else {
      return Stack(
        children: [
          widget.configSuccess ?? const SizedBox(),
          _loadingOpenView(true),
        ],
      );
    }
  }

  Widget get _buildPreloadView {
    return Stack(
      children: [
        //是否显示 跟 PageState.PRELOAD_UPDATED 有关
        widget.configPreLoad ?? const CustomPreLoadItemView(),
        Visibility(
          visible: widget.configState == PageState.PRELOAD_UPDATED,
          child: _loadingOpenView(true),
        ),
      ],
    );
  }

  ///根据不同状态来显示不同的视图 (CustomScrollView)
  List<Widget> get _buildListWidget {
    switch (widget.configState) {
      case PageState.SUCCESS:
        return widget.successSliverWidget != null
            ? widget.successSliverWidget!
            : widget.configSuccess != null
                ? [widget.configSuccess!]
                : [const SizedBox()];
      case PageState.FAILED:
        return [widget.successSliverWidget != null ? _warpStateLayout(_errorView) : _errorView];
      case PageState.LOADING:
        return [widget.successSliverWidget != null ? _warpStateLayout(_loadingView) : _loadingView];
      case PageState.EMPTY:
        return [widget.successSliverWidget != null ? _warpStateLayout(_emptyView) : _emptyView];
      default:
        return [widget.successSliverWidget != null ? _warpStateLayout(_loadingView) : _loadingView];
    }
  }

  //如果父布局是 CustomScrollView 则使用 SliverFillViewport 包裹状态布局
  Widget _warpStateLayout(Widget widget) {
    return SliverFillViewport(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return widget;
        },
        childCount: 1,
      ),
    );
  }

  ///层叠布局
  Widget get _buildWidget2 {
    return IndexedStack(
      children: [
        _loadingView,
        // _loadingOpenView,
        _emptyView,
        _errorView,
        widget.configSuccess ?? const SizedBox(),
      ],
    );
  }

  // ===================================== 真正的状态布局 ↓ =====================================
  BuildContext? buildContext;

  ///override default theme
  ThemeMode? applyThemeMode(BuildContext? context) {
    return null;
  }

  bool get _isDark {
    final themeMode = applyThemeMode(buildContext);
    return themeMode != null ? (themeMode == ThemeMode.dark) : ThemeService().isDarkMode;
  }

  ThemeData get _themeData {
    return _isDark ? ThemeService.instance.darkTheme : ThemeService.instance.lightTheme;
  }

  Color scaffoldBackgroundColor() {
    return _themeData.colorScheme.background;
  }

  ///加载中视图
  Widget get _loadingView {
    return config.getConfigLoadingView() ?? Container();
    //顶部居中处理
    // return Align(alignment:Alignment.topCenter,child: config.getConfigLoadingView() )?? Container();
  }

  ///加载中视图，是否背景可见
  Widget _loadingOpenView(bool isOpen) {
    return isOpen
        ? Container(
            // width: double.infinity,
            // height: double.infinity,
            alignment: widget.loadingCenter ? Alignment.center : Alignment.topCenter,
            color: Colors.transparent,
            child: _loadingView,
          )
        : Container(
            alignment: widget.loadingCenter ? Alignment.center : Alignment.topCenter,
            child: _loadingView,
          );
  }

  ///数据为空的视图
  Widget get _emptyView {
    return config.getConfigEmptyView(
          widget.emptyMessage,
          widget.emptyImage,
          widget.showEmptyRetry,
          () => widget.configRetry?.call(widget.configState),
        ) ??
        Container();
  }

  ///错误视图
  Widget get _errorView {
    return config.getConfigErrorView(
          widget.errorMessage,
          widget.errorImage,
          widget.showErrorRetry,
          () => widget.configRetry?.call(widget.configState),
        ) ??
        Container();
    return CustomNetWorkErrorView(
      // color: scaffoldBackgroundColor(),
      color: Colors.transparent,
      onPressed: () => widget.configRetry,
    );
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
            onTap: () => widget.configRetry,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // MyAssetImage('page_load_error.png', width: 180, height: 180, fit: BoxFit.contain),
                // MyTextView(widget.errorMessage ?? '加载数据错误，请重试'.tr, marginTop: 10, fontSize: 15.5),
                CustomAssetIcon(
                  name: "assets/images/status/ic_status_view_noti_available.webp",
                  size: imageWidth,
                ),
                SizedBox(height: 4),
                CustomText(widget.errorMessage ?? S.current.random_text_737),
              ],
            )));
  }

  Widget get _errorServerView {
    return config.getConfigErrorServerView(
          widget.netErrorMessage,
          widget.netErrorImage,
          widget.showNetErrorRetry,
          () => widget.configRetry?.call(widget.configState),
        ) ??
        Container();
  }
}
