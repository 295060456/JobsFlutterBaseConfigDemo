import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/event/event_service.dart';
import 'custom_pull_to_refresh_controller.dart';

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class CustomPullToRefresh extends StatefulWidget {
  ///是否为最后一页，如果为true，则无法加载更多
  final Widget child;
  final RefreshCallback onRefresh;
  final LoadMoreCallback? onLoadMore;
  final bool safeArea;

  /// 底部没有更多数据时的提示文字组件
  final Widget? noMoreWidget;

  /// You can use your custom scrollController, or not
  /// 你可以使用自定义的 ScrollController，或者不使用
  final ScrollController? scrollController;
  final CustomPullToRefreshController controller;

  const CustomPullToRefresh(
      {super.key,
      required this.child,
      required this.onRefresh,
      this.onLoadMore,
      this.safeArea = true,
      this.scrollController,
      this.noMoreWidget,
      required this.controller});

  @override
  _CustomPullToRefresh createState() => _CustomPullToRefresh();
}

class _CustomPullToRefresh extends State<CustomPullToRefresh> with EventListener {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController!.addListener(() async {
      if (_scrollController!.position.pixels >= _scrollController!.position.maxScrollExtent) {
        if (widget.controller.indicatorMode != CustomIndicatorMode.inactive) {
          return;
        }
        widget.controller.indicatorMode = CustomIndicatorMode.processing;
        if (mounted) {
          setState(() {
            widget.controller.indicatorMode = CustomIndicatorMode.processed;
          });
        }
        //todo: 旧代码有bug ，执行noMore 之后会再执行onLoadMore()方法，原因是没有添加CustomIndicatorMode.inactive状态判断
        if (widget.onLoadMore != null && widget.controller.controlFinishLoad) {
          await widget.onLoadMore!();
        }
        if (mounted && widget.controller.indicatorMode != CustomIndicatorMode.inactive) {
          setState(() {
            widget.controller.indicatorMode = CustomIndicatorMode.inactive;
          });
          widget.controller.indicatorMode = CustomIndicatorMode.done;
        }
      }
    });
    EventService.instance.addListener(kUpdateRefreshResultEvent, this);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainWidget = ListView(
      /// 解决item太少，无法下拉刷新的问题
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      children: [
        widget.child,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppValues.defaultPadding),
              child: _buildFoot(),
            ),
          ],
        ),
      ],
    );

    if (!widget.controller.controlFinishRefresh) {
      return mainWidget;
    }

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        if (widget.controller.indicatorMode != CustomIndicatorMode.inactive) {
          return;
        }
        widget.controller.indicatorMode = CustomIndicatorMode.processed;
        await widget.onRefresh!();
      },
      child: mainWidget,
    );
  }

  Widget _buildFoot() {
    Widget? footWidget;
    if ((widget.controller.indicatorMode != CustomIndicatorMode.inactive) &&
        widget.controller.controlFinishLoad &&
        widget.controller.footIndicatorResult != CustomIndicatorResult.noMore) {
      footWidget = const CupertinoActivityIndicator();
    } else if (widget.controller.footIndicatorResult == CustomIndicatorResult.noMore) {
      footWidget = widget.noMoreWidget ?? const Text('No more data');
    }
    return SizedBox(height: 24, child: footWidget);
  }

  @override
  void onEvent(String eventId, event) {
    // TODO: implement onEvent
    if (eventId == kUpdateRefreshResultEvent) {
      if (mounted) {
        setState(() {
          widget.controller.indicatorMode = CustomIndicatorMode.inactive;
        });
      }
    }
  }
}
