
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_state_controller.dart';
import '../../services/api/api_service.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/route_util.dart';
import '../../utils/sp_util.dart';
import '../../widget/custom_marquee.dart';


class NoticeController extends GetxController with GetTickerProviderStateMixin {
  NoticeController();
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  var dataList = [].obs;
  var loading = false;

  late TabController tabController;
  var tabIndex = 0.obs;
  var tabs = [
    Tab(
      child: Text(S.current.random_text_687, style: ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
    ),
    Tab(
      child: Text(S.current.random_text_688, style: ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
    ),
    Tab(
      child: Text(S.current.random_text_689, style: ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
    ),
    Tab(
      child: Text(S.current.random_text_690, style: ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
    ),
  ];

  buildData(list) {
    if (loading) {
      return;
    }
    loading = true;
    dataList = list;
    List<String> ids = [];
    List<Tab> temps = [];
    for (Marquee element in dataList) {
      if (element.bounceFrequency == 2) {
        ids.add(element.id!);
      }
      temps.add(Tab(child: Text(element.title, style: ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))));
    }
    tabs.clear();
    tabs.addAll(temps);
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.addListener(() {
      if (tabIndex.value != tabController.index) {
        tabIndex.value = tabController.index;
      }
    });
    loadData(1,ids);
  }

  _initData() {
    update(["notice"]);
  }

  void loadData(int types,ids) async {
    await ApiService.instance.noticeLimit(
      types: types,
      ids: ids,
      success: (res) {
      
      },
      fail: (errorMessage) {
      }
    );
  }

  void onTap(Marquee model) {
    model.selected!.value = !model.selected!.value;
  }

  void nomore() {
    List ids = [];
    for (Marquee element in dataList) {
      if (element.selected!.value) {
        ids.add(element.id!);
      }
    }
    if (ids.isNotEmpty) {
      if (globalController.isLogin.value) {
        loadData(2,ids);
      }
      var dic = SPUtil().getJson('days');
      var today = DateTime.now().day.toString();
      if (dic != null && dic.containsKey(today)) {
        ids.addAll(dic[today]);
      }
      SPUtil().setJson('days',{today: ids});
    }
  }

  void onTapClose() {
    nomore();
    RouteUtil.popView();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
