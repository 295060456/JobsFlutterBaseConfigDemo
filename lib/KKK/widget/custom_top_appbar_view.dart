import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_urls_values.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/model/wallet/CurrencyBean.dart';
import 'package:flutter_bet/pages/main/logic.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/custom_rotating_arrow.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/dialog/dialog_utils.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:get/get.dart';

import '../app/modules/wallet/views/wallet_dialog_view.dart';
import '../constant/app_cache_key.dart';
import '../pages/personal_center/wallet/custom_wallet_setting.dart';
import '../routes/routes.dart';
import '../utils/route_util.dart';
import '../utils/sp_util.dart';

///顶部公共appbar
const bubbleWidth = 220.0;

class CustomTopAppBarView extends GetView<MainLogic> {
  ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);

  final GlobalKey<RotatingArrowState> _rotatingArrowKey = GlobalKey<RotatingArrowState>();
  final GlobalStateController globalController = Get.find<GlobalStateController>();
  final VoidCallback? onTap;
  final VoidCallback? onTapLogo;
  final bool? isShowLogo;

  void _startAnimation() {
    _rotatingArrowKey.currentState?.startAnimation();
  }

  void _stopAnimation() {
    _rotatingArrowKey.currentState?.resetAnimation();
  }

  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey _globalKeyPerson = GlobalKey();
  late MainLogic logic;
  late bool hiddenBalance;

  CustomTopAppBarView({super.key, this.onTap, this.isShowLogo, this.onTapLogo});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MainLogic());
    logic = Get.find<MainLogic>();
    logic.context = context;
    return _titleView(context);
  }

  Widget _titleView(BuildContext context) {
    return Obx(() => globalController.isLogin.value ? _alreadyLogin(context) : _notLogin());
  }

  Widget _alreadyLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isShowLogo ?? true,
          child: GestureDetector(
            onTap: () {
              if (onTapLogo != null) {
                onTapLogo!.call();
              }
            },
            child: CustomNetWorkImage(
              imageUrl:
                  '${AppUrlsValues.envConfig.asset_url}/${controller.globalController.brandDetailPc?['pc']?['pc_first_letter']}',
              errorWidget: const CustomAssetIcon(
                size: 60,
                name: 'assets/images/home/ic_sg_logo.webp',
              ),
              width: 60,
              height: 60,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            key: _globalKey,
            children: [
              GestureDetector(
                onTap: () {
                  hiddenBalance = !(SPUtil().getBool(
                          "${CacheKey.isHiddenBalance}${AccountService.sharedInstance.currentUser?.uid}") ??
                      false);
                  // globalController.scale.value = 0.9;
                  // Future.delayed(const Duration(milliseconds: 100), () {
                  //   globalController.scale.value = 1.0;
                  // });
                  globalController.resetSearchList();
                  if (controller.isShowCustomMineRightDialogV2 ||
                      controller.isShowCustomBubbleDialog) {
                    Get.back();
                    if (controller.isShowCustomBubbleDialog) {
                      _stopAnimation();
                    }
                  } else {
                    _startAnimation();
                    DialogUtils.showCustomBubbleDialog(
                      context, _selectCoinsType(context), bubbleWidth,
                      widgetKey: _globalKey,
                      backgroundColor: AppThemes.textColorWhite,
                      globalKey: _rotatingArrowKey,
                      bubbleArrowWidth: 12,
                      bubbleArrowHeight: 8,
                      onCloseCallback: () {
                        controller.isShowCustomBubbleDialog = false;
                      },
                      //     onDismissCallback: () {
                      //   globalController.scale.value = 0.9;
                      //   Future.delayed(const Duration(milliseconds: 100), () {
                      //     globalController.scale.value = 1.0;
                      //   });
                      // }
                    );
                    controller.isShowCustomBubbleDialog = true;
                  }
                },
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: ThemeService().colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn, // 使用弹性曲线
                    transform: Matrix4.identity()..scale(globalController.scale.value),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6,
                        ),
                        Obx(() {
                          return CustomText(
                              // "${globalController.currTypeSelected.value.symbol}\t${globalController.truncateText(globalController.currTypeSelected.value.amount ?? "", 13)}",
                              globalController.truncateText(
                                  globalController.currTypeSelected.value.amount ?? "", 13),
                              style: ThemeService()
                                  .theme
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500));
                        }),
                        const SizedBox(
                          width: AppValues.margin_4,
                        ),
                        CustomNetWorkImage(
                          placeholder: const CustomAssetIcon(
                            name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                          ),
                          errorWidget: const CustomAssetIcon(
                            name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                          ),
                          width: 18,
                          height: 18,
                          imageUrl: globalController.currTypeSelected.value.coinIc ?? "",
                        ),
                        const SizedBox(
                          width: AppValues.margin_4,
                        ),
                        RotatingArrow(
                          key: _rotatingArrowKey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // RouteUtil.pushToView(Routes.personalWallet);
                  RouteUtil.popView();
                  WalletDialogView.openDialog();
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: ThemeService().colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 13,
                      ),
                      CustomAssetIcon(
                        name: "assets/images/top_wallet.png",
                        size: 18,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              // 设置透明色的高亮颜色和溅射颜色
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              // 通过borderRadius和border去除默认涟漪效果
              // borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                if (controller.isShowCustomMineRightDialogV2 ||
                    controller.isShowCustomBubbleDialog) {
                  Get.back();
                  if (controller.isShowCustomBubbleDialog) {
                    _stopAnimation();
                  }
                } else {
                  DialogUtils.showCustomMineRightDialogV2(context, _globalKeyPerson, () {
                    controller.isShowCustomMineRightDialogV2 = false;
                  });
                  controller.isShowCustomMineRightDialogV2 = true;
                }
              },

              child: Padding(
                key: _globalKeyPerson,
                padding: const EdgeInsets.only(left: 6, right: 4, top: 16, bottom: 16),
                child: const CustomAssetIcon(
                  size: 18,
                  name: "assets/images/top_person_center.png",
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {
                RouteUtil.pushToView(Routes.notifsPage, onBack: (d) {
                  globalController.showOverlayView();
                });
                globalController.showOverlayView(isShowTopBarView: false);
              },
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    child: CustomAssetIcon(
                      name: "assets/images/top_notification.png",
                      size: 18,
                    ),
                  ),
                  Positioned(
                      top: 12,
                      right: 4,
                      child: Obx(() => logic.showNotice.value
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppThemes.primaryContainer,
                              ),
                            )
                          : Container())),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _notLogin() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Visibility(
        visible: isShowLogo ?? true,
        child: GestureDetector(
          onTap: onTapLogo ?? () {},
          // onTap: onTap,
          //     () {
          //   RouteUtil.pushToView(Routes.frontPage);
          // },
          child: Container(
            child: CustomNetWorkImage(
              imageUrl:
                  '${AppUrlsValues.envConfig.asset_url}/${controller.globalController.brandDetailPc?['pc']?['pc_logo_white']}',
              errorWidget: const CustomAssetIcon(
                size: 80,
                name: 'assets/images/home/ic_sg_logo.webp',
              ),
              width: 80,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              // if (globalController.loginRegister.value != 1) {
              //   if (globalController.loginRegister.value == 2) {
              //     RouteUtil.popView();
              //   }
              //   Future.delayed(const Duration(milliseconds: 200),() {
              //     showCustomLoginWidget(context: controller.context!);
              //   });
              // }
              globalController.doGoToLogin(controller.context!);
              // RouteUtil.pushToView(Routes.loginPage);
            },
            // child: CustomText(
            //   S.current.top_login,
            //   style: ThemeService()
            //       .theme
            //       .textTheme
            //       .bodyMedium
            //       ?.copyWith(fontWeight: FontWeight.w600),
            // )
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(4))),
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
              child: CustomText(S.current.top_login_copy,
                  style: ThemeService()
                      .theme
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ),
          ),
          GestureDetector(
            onTap: () {
              // if (globalController.loginRegister.value != 2) {
              //   if (globalController.loginRegister.value == 1) {
              //     RouteUtil.popView();
              //   }
              //   Future.delayed(const Duration(milliseconds: 200),() {
              //     showCustomRegisterWidget(context: controller.context!);
              //   });
              // }
              globalController.doGoToRegister(controller.context!);
              // RouteUtil.pushToView(Routes.registerPage);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeService().colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
              child: CustomText(S.current.top_register,
                  style: ThemeService()
                      .theme
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ),
          )
        ],
      )
    ]);
  }

  Widget _selectCoinsTypeNoBar(BuildContext context) {
    return Obx(() {
      return Container(
        constraints: const BoxConstraints(maxHeight: 318),
        child: RawScrollbar(
          thumbVisibility: false,
          padding: EdgeInsets.zero,
          minOverscrollLength: 40,
          minThumbLength: 40,
          thumbColor: AppThemes.textColorSecondary,
          controller: _scrollController,
          radius: const Radius.circular(6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ..._buildCoinItems(hiddenBalance
                    ? globalController.currTypeLists
                    : globalController.currTypeLists
                        .where((bean) => double.parse(bean.amount ?? "0") > 0)
                        .toList())
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _selectCoinsTypeHaveBar() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 318),
      child: RawScrollbar(
        thumbVisibility: false,
        padding: EdgeInsets.zero,
        minOverscrollLength: 40,
        minThumbLength: 40,
        thumbColor: AppThemes.textColorSecondary,
        controller: _scrollController,
        radius: const Radius.circular(6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: hiddenBalance
                    ? globalController.currTypeLists.length
                    : globalController.currTypeLists
                        .where((bean) => double.parse(bean.amount ?? "0") > 0)
                        .toList()
                        .length,
                itemBuilder: (BuildContext context, int index) {
                  return _coinItem(hiddenBalance
                      ? globalController.currTypeLists[index]
                      : globalController.currTypeLists
                          .where((bean) => double.parse(bean.amount ?? "0") > 0)
                          .toList()[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCoinItems(List<CurrencyBean> coinList) {
    List<Widget> items = [];
    for (var coin in coinList) {
      items.add(_coinItem(coin));
    }
    return items;
  }

  Widget _selectCoinsType(BuildContext context) {
    if (globalController.currTypeLists.isEmpty) {
      globalController.syncData();
    }
    return Column(
      children: [
        const SizedBox(height: AppValues.margin_10),
        _buildSearchView(),
        const SizedBox(height: AppValues.margin_12),
        Obx(() {
          int coinCount = hiddenBalance
              ? globalController.currTypeLists.length
              : globalController.currTypeLists
                  .where((bean) => double.parse(bean.amount ?? "0") > 0)
                  .toList()
                  .length;
          return hiddenBalance ||
                  globalController.currTypeLists
                      .where((bean) => double.parse(bean.amount ?? "0") > 0)
                      .toList()
                      .isNotEmpty
              ? coinCount > 10
                  ? _selectCoinsTypeHaveBar()
                  : _selectCoinsTypeNoBar(context)
              : Container(
                  margin: const EdgeInsets.only(bottom: AppValues.margin_12),
                  child: CustomText(
                    S.current.random_text_822,
                    textColorStyle: CustomTextColorStyle.dark,
                  ));
        }),
        // const SizedBox(height: AppValues.margin_12),
        const Divider(
          height: 1,
          color: AppThemes.whiteD5DCEB,
          indent: 0,
          endIndent: 0,
          thickness: 2,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
            showCustomWalletSettingWidget(context: context);
          },
          child: Container(
            height: 36,
            // color: ThemeService().theme.scaffoldBackgroundColor,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              // color: ThemeService().theme.scaffoldBackgroundColor,
              color: AppThemes.widgetColorWhite,
              // gradient: LinearGradient(
              //   colors: [
              //     ThemeService().theme.scaffoldBackgroundColor,
              //     ThemeService().colorScheme.surface,
              //     // ThemeService().colorScheme.surface,
              //     // ThemeService().theme.scaffoldBackgroundColor,
              //     // Colors.black54
              //   ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   // stops: [0.4,0.8],
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.6),
              //     spreadRadius: 5,
              //     blurRadius: 10,
              //     offset: Offset(0, 20), // changes position of shadow
              //   ),
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const CustomAssetIcon(name: "assets/images/top_wallet_setting.png"),
                CustomAssetIcon(
                    color: ThemeService().colorScheme.tertiary,
                    name: "assets/images/personal_center_icon/top_wallet_setup.webp"),
                const SizedBox(
                  width: 8,
                ),
                CustomText(
                  S.current.top_wallet_setting,
                  style: const TextStyle(
                      fontSize: 14, color: AppThemes.tertiaryColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _coinItem(CurrencyBean currencyBean) {
    // bool isSelected = globalController.isSelectedItem(globalController.currTypeLists[index]);
    return CupertinoButton(
      minSize: 32.0,
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.back();
        //保存选中的
        // CurrencyBean currencyBean = globalController.currTypeLists[index];
        currencyBean.isSelected = true;
        globalController.saveSelected(currencyBean);
      },
      child: Container(
        // color: isSelected ? ThemeService().colorScheme.primary : Colors.transparent,
        color: Colors.transparent,
        // padding: const EdgeInsets.only(top: AppValues.margin_6, bottom: AppValues.margin_6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                CustomText(
                  // "${globalController.currTypeLists[index].currency_type==1?"${globalController.currTypeLists[index].symbol}\t":""}${globalController.truncateText(globalController.currTypeLists[index].amount ?? "", 13)}",
                  "${globalController.truncateText(currencyBean.amount ?? "", 13)}",
                  style: const TextStyle(
                      fontSize: 14, color: AppThemes.tertiaryColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 80,
              child: Row(
                children: [
                  CustomNetWorkImage(
                    imageUrl: currencyBean.coinIc ?? "",
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    currencyBean.name ?? " ",
                    style: const TextStyle(
                        fontSize: 14, color: AppThemes.tertiaryColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSearchView() {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: AppValues.margin_10),
      child: CupertinoSearchTextField(
        prefixInsets: const EdgeInsets.only(left: 10),
        prefixIcon: const CustomAssetIcon(
          name: "assets/images/top_search_ic.png",
          size: 16,
        ),
        itemColor: AppThemes.secondaryIconColor,
        placeholder: S.current.random_text_452,
        // placeholderStyle: const TextStyle(color: AppThemes.white566771, fontWeight: FontWeight.w500),
        placeholderStyle:
            const TextStyle(color: AppThemes.tertiaryColor, fontWeight: FontWeight.w500),
        decoration: BoxDecoration(
          color: AppThemes.widgetColorWhite,
          border: Border.all(color: AppThemes.whiteD5DCEB, width: 2.0),
          // Add a border
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // 阴影颜色
              spreadRadius: 0, // 扩散半径
              blurRadius: 2, // 模糊半径
              offset: const Offset(0, 1), // 阴影偏移量
            ),
          ],
        ),
        style: const TextStyle(
            fontSize: 14, color: AppThemes.tertiaryColor, fontWeight: FontWeight.w500),
        onChanged: (String value) {
          log('The text has changed to: $value');
          globalController.updateSearchList(value);
        },
        onSubmitted: (String value) {
          log('Submitted text: $value');
        },
      ),
    );
  }
}
