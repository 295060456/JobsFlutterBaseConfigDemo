import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/route_util.dart';
import '../custom_icon.dart';
import '../custom_text.dart';
import 'custom_safe_dialog.dart';

///弹性对话框 基本框架
class CustomDialogBaseView extends StatefulWidget {
  CustomDialogBaseView({super.key, this.dialogMaxHeight});

  final double? dialogMaxHeight;

  List<Widget> get contentView => buildContentView();

  String get titleAsset => buildTitleAsset();

  String get titleLabel => buildTitleLabel();

  /// 动作状态
  bool onBackAction = false;
  bool onCloseAction = false;

  ///点击方法
  void onBackDialog() {}

  ///点击方法
  void onCloseDialog() {
    RouteUtil.popView();
  }

  ///生命周期方法，对话框销毁。最后调用
  void onDeleteDialog() {}

  String buildTitleAsset() {
    return "";
  }

  String buildTitleLabel() {
    return "";
  }

  List<Widget> buildContentView() {
    return <Widget>[];
  }

  ///静态方法，打开方法, 显示窗口
  static Future<void> showDetailDialog<T>({
    required BuildContext context,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
    // required BettingRecordApiModel recordModel,
    // required CasinoGameTypeEnum gameType,
    required CustomDialogBaseView dialogView,
  }) async {
    await CustomSafeDialog.show<T>(
        context: context,
        // tag: kCasinoDetailWidget,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  if (barrierDismissible) {
                    RouteUtil.popView();
                  }
                },
              )),
              dialogView,
              Expanded(child: GestureDetector(
                onTap: () {
                  if (barrierDismissible) {
                    RouteUtil.popView();
                  }
                },
              )),
            ],
          );
        }).then((value) {
      //关闭回调
      log("CustomDialogBaseView 关闭回调");
      dialogView.onDeleteDialog();
    });
  }

  @override
  State<CustomDialogBaseView> createState() => _CustomDialogBaseViewState();
}

class _CustomDialogBaseViewState extends State<CustomDialogBaseView> {
  double _dialogMaxHeight = Get.height - 100;

  @override
  void initState() {
    super.initState();
    if (widget.dialogMaxHeight != null) {
      _dialogMaxHeight = widget.dialogMaxHeight!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 在widget初始化之后访问GlobalKey.currentState
      // do something
      // getWidgetOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: _dialogMaxHeight,
          child: LayoutBuilder(
            builder: (_, constraints) {
              // log("CustomCasinoDetailDialogWidget...constraints...$constraints");
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer(),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: ThemeService().colorScheme.background,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: AppValues.margin_2),
                        //表头
                        _buildTopTitleView(),
                        //正文
                        _buildContentDetailView(),
                      ],
                    ),
                  ),

                  // Expanded(child: _buildCasinoDetailView())
                  // Center(child: _buildCasinoDetailView()),
                  // const SizedBox(height: AppValues.defaultMargin),
                  Expanded(child: Container()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildTopTitleView() {
    return Container(
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 12),
          Visibility(
            visible: widget.titleAsset.isNotEmpty,
            child: InkWell(
              onTap: () {
                widget.onBackDialog();
              },
              child: Padding(
                padding: EdgeInsets.zero,
                child: CustomIcon(
                  color: AppThemes.iconColor,
                  // asset: "assets/images/bet_slip/ic_casino_bet_order.webp",
                  asset: widget.titleAsset,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          CustomText(
            // S.current.tab_bar_order,
            widget.titleLabel,
            style: ThemeService()
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              widget.onCloseDialog();
            },
            child: const Padding(
              padding: EdgeInsets.all(AppValues.defaultPadding),
              child: CustomIcon(
                asset: 'assets/images/normal/ic_normal_close.png',
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildContentDetailView() {
    return ConstrainedBox(
        constraints: BoxConstraints.loose(Size.fromHeight(_dialogMaxHeight - 60)),
        child: Container(
          // alignment: Alignment.center,
          // height: constraints.maxHeight,
          // constraints: BoxConstraints.loose(),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              // shrinkWrap: true,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: widget.contentView,
            ),
          ),
        ));
  }
}
