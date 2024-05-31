import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_themes.dart';
import '../../../constant/app_values.dart';
import '../../../controllers/global_state_controller.dart';
import '../../../model/notice_model.dart';
import '../../../services/theme/theme_service.dart';
import '../../../widget/custom_asset_icon.dart';
import '../../../widget/custom_icon.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/dialog/custom_safe_dialog.dart';
import '../../../widget/network_image/custom_network_image.dart';
import '../../../widget/tab_bar/custom_tab_bar_with_icon.dart';
import 'index.dart';

class NoticePage extends GetView<NoticeController> {
  
  NoticePage(this.dataList,{Key? key,}) : super(key: key);
  final GlobalStateController globalController = Get.find<GlobalStateController>();
  final List? dataList;

  // 主视图
  Widget _buildView() {
    controller.buildData(dataList);
    return Stack(
      children: [
        GestureDetector(
          onTap: controller.onTapClose,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppValues.defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppValues.padding_16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppValues.smallRadius),
                      color: ThemeService().theme.scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        _buildTop(),
                        _buildBody(),
                      ],
                    ),
                  ),
                  Obx(() => _buildTips(dataList![controller.tabIndex.value]))
                ],
              ),
            ),
          )
        )
      ],
    );
  }

  Widget _buildTips(Marquee model) {
    return model.isLimit == 1 ? Column(
      children: [
        const SizedBox(height: AppValues.padding_16,),
        GestureDetector(
          onTap: () => controller.onTap(model),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => CustomAssetIcon(name: model.selected!.value ? 'assets/images/notice/gou.png' : 'assets/images/notice/box.png')),
              const SizedBox(height: AppValues.padding_4,),
              CustomText(S.current.random_text_691,style: const TextStyle(fontWeight: FontWeight.w500),)
            ],
          )
        )
      ],
    ) : Container();
  }

  Widget _buildTop() {
    return Column(
      children: [
        Row(
          children: [
            const CustomIcon(
              asset: 'assets/images/notice/notice.png',
              size: 16,
            ),
            const SizedBox(width: AppValues.padding_4,),
            CustomText(
              S.current.random_text_692,
              style: ThemeService().textTheme.bodyLarge?.copyWith(fontSize: 16,fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            InkWell(
              onTap: controller.onTapClose,
              child: const CustomIcon(
                asset: 'assets/images/normal/ic_normal_close.png',
                size: 18,
              ),
            )
          ],
        ),
        const SizedBox(height: AppValues.padding_16,),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        if (dataList!.length > 1)
        _tabBar(),
        _tabBarView()
      ],
    );
  }

  Widget _tabBar(){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppValues.padding_16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: ThemeService().theme.colorScheme.surface, // 设置背景色
      ),
      child: CustomTabBarWithIcon(
        tabController: controller.tabController,
        // 将TabController与TabBar关联
        tabs: controller.tabs,
        backgroundColor: ThemeService().theme.colorScheme.tertiary,
        radius: 40,
        height: 46,
        buttonMargin: const EdgeInsets.all(3),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }

  Widget _tabBarView() {
    return SizedBox(
      height: 250,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(), //禁止滑动
        controller: controller.tabController, // 将TabController与TabBarView关联
        children: dataList!.map((e) => _contentView(e)).toList()
      )
    );
  }

  Widget _contentView(Marquee model) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.smallRadius),
        color: const Color(0xff13212d),
      ),
      child: model.popUpType == 1 ? Padding( // 1文字 2图片
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding,vertical: AppValues.sportPadding_10),
        child: CustomText(
          model.content,
          style: const TextStyle(color: AppThemes.textColorSecondary),
        ),
      )
      : CustomNetWorkImage(
          imageUrl: model.imgUrl,
          width: double.infinity,
          fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeController>(
      init: NoticeController(),
      id: "notice",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("notice")),
          backgroundColor: Colors.transparent,
          body: _buildView(),
        );
      },
    );
  }
}

Future<void> showNoticeWidget<T>({
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  List? list,
}) async {
  await CustomSafeDialog.show<T>(
      context: Get.context!,
      tag: 'kNoticeWidget',
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return NoticePage(list);
      });
}