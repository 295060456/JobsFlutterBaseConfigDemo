import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/global_state_controller.dart';
import '../services/account_service.dart';
import '../services/event/event_service.dart';
import '../widget/app_bar/custom_app_bar.dart';
import '../widget/update/custom_update_controller.dart';
import 'code.dart';
import 'widget/main_page_bottom_bar_controller.dart';

class MainLogic extends BaseController with EventListener, ActivityBizMixin, ActivityBizQuickMixin {
  final bottomBarController = MainPageBottomBarController();

  final _selectedMenuCodeObs = MenuCode.GAME.obs; //默认选择页

  MenuCode get selectedMenuCode => _selectedMenuCodeObs.value;

  final lifeCardUpdateController = false.obs;
  AccountServiceListener? accountListener;

  OverlayEntry? overlayTopBarEntry; //顶部bar View
  OverlayEntry? overlayBottomBarEntry; //底部按钮 view
  bool isShowCustomBubbleDialog = false; //是否显示币种列表
  bool isShowCustomMineRightDialogV2 = false; //是否显示个人设置列表

  var offset = 0.0;

  ///获取 实例对象
  static MainLogic of() {
    return Get.find<MainLogic>();
  }

  ///手动点击底部菜单才会调用该方法
  void onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeObs.value = menuCode;
    globalController.buttonSelectIndex.value = menuCode.index;
  }

  BuildContext? context;
  late RxList<String> bannersWithLogin = <String>[].obs;
  late RxList<String> bannersWithNoLogin = <String>[].obs;
  var noticeList = [].obs;
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  final updateController = CustomUpdateController();
  final showNotice = false.obs;

  ///收到总线事件 才会调用该方法，
  selectedMenu(MenuCode code) {
    onMenuSelected(code);
  }

  @override
  void onReady() {
    super.onReady();
    EventService.instance.addListener(kChangeMainPageEvent, this);
    getNotice(context!);
    if (globalController.isLogin.value) {
      notificationsCount();
    }
    ever(globalController.isLogin, (callback) {
      if (globalController.isLogin.value) {
        getNotice(context!);
        notificationsCount();
      }
    });
    ever(globalController.newNotice, (callback) {
      if (globalController.newNotice.value) {
        showNotice.value = true;
        globalController.newNotice.value = false;
      }
    });
    ever(globalController.isShowTopBar, (sure) {
      if (sure) {
        _showTopBarView(Get.overlayContext!);
      } else {
        if (overlayTopBarEntry != null) {
          overlayTopBarEntry?.remove();
          overlayTopBarEntry = null;
        }
      }
    });
    ever(globalController.isShowBottomBar, (sure) {
      if (sure) {
        _showBottomBarView(Get.overlayContext!);
      } else {
        if (overlayBottomBarEntry != null) {
          overlayBottomBarEntry?.remove();
          overlayBottomBarEntry = null;
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //显示快捷入口,
      // todo:0502 改为首页娱乐城 和 体育 才显示
      // _insertOverlay(Get.overlayContext!);
      initActivityBizQuickMixin();
      //添加nav
      _showTopBarView(Get.overlayContext!);
      //添加bottom
      _showBottomBarView(Get.overlayContext!);
      //显示 活动对话框
      CustomMainActivityDialogLogic.of().loadMainActivityDialog();
    });
  }

  void _insertOverlay(BuildContext context) {
    Overlay.of(context).insert(
      OverlayEntry(builder: (context) {
        // final size = MediaQuery.of(context).size;
        return Positioned(
          // width: 56,
          // height: 56,
          // top: size.height - 72,
          // left: size.width - 72,
          // bottom: Get.height * 0.19,
          bottom: 108.h,
          right: 12,
          child: Obx(() {
            return CustomFloatingActionWidget(
              isShow: activityFloatObs.value && activityFloatListObs.isNotEmpty,
              // isShow:true,
              modelList: activityFloatListObs,
              onClickItem: (ActivityQuickA
              piModel model) {
                onQuickActivityItemClick(model);
              },
              onClickClose: () {
                onQuickActivityClickClose();
              },
            );
          }),
        );
      }),
    );
  }

  void _showTopBarView(BuildContext context) {
    if (overlayTopBarEntry == null) {
      overlayTopBarEntry = OverlayEntry(builder: (context) {
        return Positioned(
          width: Get.width,
          top: 0,
          left: 0,
          child: CustomAppBar(
            titleSpacing: 12.0,
            titleView: CustomTopAppBarView(
              onTapLogo: () {
                //如果是浏览界面
                if (selectedMenuCode == MenuCode.HOME_MENU) {
                  HomeLogic.of().doGotoCloseSearchView();
                  MainLogic.of().onMenuSelected(MenuCode.GAME);
                }
                if (globalController.isInRecreationView.value) {
                  try {
                    var controller = Get.find<FindLogic>();
                    controller.scrollcontroller.animateTo(0.0,
                        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  } catch (e) {}
                } else {
                  if (globalController.backToMain.value == true) {
                    globalController.backToMain.value = false;
                    RouteUtil.popToFirst(Routes.mainPage);
                    return;
                  }
                  Get.back();
                }
              },
            ),
            showLeading: false,
          ),
        );
      });
      Overlay.of(context).insert(overlayTopBarEntry!);
    }
  }

  void _showBottomBarView(BuildContext context) {
    if (overlayBottomBarEntry == null) {
      overlayBottomBarEntry = OverlayEntry(builder: (context) {
        // final size = MediaQuery.of(context).size;
        return Positioned(
          width: Get.width,
          height: AppValues.barBottomHeight,
          bottom: 0,
          left: 0,
          child: Container(
            child: MainPageBottomBarWidget(
              onMenuTap: (int code) {
                RouteUtil.popToFirst(Routes.mainPage);
                onMenuSelected(MenuCode.values[code]);
                bool isShow = (code == 0 || code == 1 || code == 3);
                globalController.showOverlayView(isShowTopBarView: isShow);
                if (code == 3) {
                  Future.delayed(const Duration(milliseconds: 20), () {
                    try {
                      MessageLogic.of().state.sc.jumpTo(offset);
                    } catch (e) {}
                  });
                } else {
                  try {
                    var controller = MessageLogic.of();
                    if (controller.state.sc.hasClients) {
                      offset = controller.state.sc.offset;
                    }
                  } catch (e) {}
                }
              },
              initSelectdIndex: 1,
              controller: bottomBarController,
            ),
          ),
        );
      });
      Overlay.of(context).insert(overlayBottomBarEntry!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadQuickActivity();
  }

  // 公告接口  await ApiService.instance.announcementList(typeCode: "1",
  Future<void> getNotice(BuildContext context) async {
    var dic = SPUtil().getJson('days');
    var today = DateTime.now().day.toString();
    var ids = [];
    if (dic != null && dic.containsKey(today)) {
      ids.addAll(dic[today]);
    }
    await ApiService.instance.getGameMarquee(
        success: (model) {
          noticeList.clear();
          if (ids.isNotEmpty) {
            List<Marquee> temps = [];
            for (var element in model.notice!) {
              var sel = false;
              for (var id in ids) {
                if (element.id == id) {
                  sel = true;
                }
              }
              if (!sel) {
                temps.add(element);
              }
            }
            model.notice!.assignAll(temps);
          }
          if (model.notice!.length > 4) {
            for (var i = 0; i < 4; i++) {
              noticeList.add(model.notice![i]);
            }
          } else {
            noticeList.addAll(model.notice!);
          }
          if (noticeList.isNotEmpty) showNoticeWidget(list: noticeList);
        },
        fail: (errorMessage) {});
  }

  notificationsCount() async {
    await ApiService.instance.notificationsCount(success: (res) {
      if (res['notification_count'] != 0 ||
          res['notice_count'] != 0 ||
          res['station_count'] != 0 ||
          res['reward_count'] != 0) {
        showNotice.value = true;
      } else {
        showNotice.value = false;
      }
    }, fail: (errorMessage) {
      showNotice.value = false;
    });
  }

  @override
  void onEvent(String eventId, event) {
    if (eventId == kChangeMainPageEvent) {
      selectedMenu(event);
    }
  }

  @override
  onClose() {
    /// 移除事件监听
    EventService.instance.removeListener(kChangeMainPageEvent, this);
    if (accountListener != null) {
      AccountService.sharedInstance.removeListener(accountListener!);
    }
    super.onClose();
  }

  showUpdateDialog() {
    showCustomUpdateDialog(
        context: Get.context!,
        title: S.current.random_text_343,
        remark: S.current.random_text_344,
        canForceUpdate: true,
        controller: updateController,
        onConfirm: () {
          updateController.setStateText(S.current.random_text_345);
          updateController.setStartDownLoad(true);
          _updateApp('https://dk0gdtx9n13r0.cloudfront.net/dev11-02_10-24-24.apk');
        });
  }

  Future<void> _updateApp(String url) async {
    if (Platform.isAndroid) {
      ApkInstallService.instance.downloadAndInstall(url, onDownload: (received, total) async {
        double process = double.parse((received / total).toStringAsFixed(2));
        if (kDebugMode) {
          print("正在下载$received/$total");
        }
        if (process >= 1.0) {
          updateController.setStateText(S.current.random_text_346);
          updateController.setProgress(1);
        } else if (process > 0 && process < 1.0) {
          final text = '下载 ${(process * 100).toStringAsFixed(0)}%';
          updateController.setStateText(text);
          updateController.setProgress(process);
        }
      }, onDownloadFailed: () async {
        await Get.defaultDialog(
            barrierDismissible: false,
            title: S.current.random_text_347,
            middleText: S.current.random_text_348,
            textConfirm: S.current.random_text_349,
            confirmTextColor: AppThemes.secondaryColor,
            textCancel: S.current.random_text_350,
            cancelTextColor: Colors.black,
            buttonColor: Colors.black,
            onConfirm: () {
              _updateApp(url);
              Get.back();
            },
            onCancel: () {
              Get.back();
              Get.back();
              // getHomeBulletin();
            });
      }, onInstallFailed: () async {
        // getHomeBulletin();
      }, onInstalled: () async {
        // getHomeBulletin();
      });
    } else {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
