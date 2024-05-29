import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/preload/preload_item_config.dart';

import '../../constant/app_values.dart';
import '../../services/theme/theme_service.dart';
import '../row/custom_row_expanded_widget.dart';
import 'custom_preload_cell_view.dart';

///预加载 骨架屏 view
class CustomPreLoadItemView extends StatelessWidget {
  const CustomPreLoadItemView({
    super.key,
    this.itemCount = 8,
    this.itemHeight = 54,
    this.itemRadius,
    this.itemExpanded,
    this.itemPreloadConfigs,
  });

  final int itemCount;
  final double? itemHeight;
  final double? itemRadius;
  final List<int>? itemExpanded; //注意数量 要和 itemPreloadConfigs保持一致
  final List<PreloadItemConfig>? itemPreloadConfigs;
  static final List<int> defaultExpanded = [0, 1, 2, 0];

  @override
  Widget build(BuildContext context) {
    return _buildShimmerView();
  }

  // 骨架屏效果
  Widget _buildShimmerView() {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: itemHeight,
              padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
              decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? ThemeService().theme.colorScheme.surfaceVariant
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(itemRadius ?? 4)),
              child: CustomRowExpandedWidget(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                expanded: itemExpanded ?? defaultExpanded,
                children: getChildrenItemView(index),
              ),
            );
          }),
    );
  }

  List<Widget> getChildrenItemView(int index) {
    //如果没有， 就按照defaultExpanded 来配置来
    if (itemPreloadConfigs == null || itemPreloadConfigs!.isEmpty) {
      return [
        CustomPreLoadCellView(config: PreloadItemConfig(w: 16, h: 16, radius: 16, leftMargin: 5)),
        CustomPreLoadCellView(
            config: PreloadItemConfig(
          w: 80,
          leftMargin: 12,
          rightMargin: index % 2 == 1 ? 20 : 40,
        )),
        CustomPreLoadCellView(config: PreloadItemConfig(w: 140)),
        CustomPreLoadCellView(config: PreloadItemConfig(w: 16, h: 16, radius: 16, leftMargin: 12)),
      ];
    } else {
      return itemPreloadConfigs!.map((e) => CustomPreLoadCellView(config: e)).toList();
    }
  }

  int _getExpandFlex(int index) {
    if (itemExpanded != null && itemExpanded!.isNotEmpty && index < itemExpanded!.length) {
      return itemExpanded![index];
    } else {
      return 1;
    }
  }
}
