import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/custom_icon.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';

import '../../constant/app_values.dart';
import 'expand_item_model.dart';
import 'expand_list_model.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/function.dart';
import 'custom_expansion_panel.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {super.key,
      required this.onExpansionTap,
      required this.data,
      this.colorScheme,
      this.trackColor,
      this.thumbColor,
      this.type = 0,
      this.langChooseId = 2,
      this.isNormal = true,
      this.oddsChooseId = 5});

  ///点击item回调函数
  final ParamSingleCallback<ExpandItemModel> onExpansionTap;

  ///传入数据
  final List<ExpandListModel> data;
  final ColorScheme? colorScheme;
  final Color? trackColor;
  final Color? thumbColor;

  ///0:赔率格式 1:语种
  final int? type;

  ///赔率格式选中id，默认为5
  final int? oddsChooseId;

  ///语种选中id，默认为5
  final int? langChooseId;

  /// 非维护状态
  final bool isNormal;

  @override
  State<StatefulWidget> createState() => _createExpansionState();
}

class _createExpansionState extends State<CustomExpansionTile> {
  late ColorScheme? defaultColorScheme;
  late int oddsId;
  late int langId;

  @override
  void initState() {
    super.initState();
    oddsId = widget.oddsChooseId!;
    langId = widget.langChooseId!;
    defaultColorScheme = widget.colorScheme ?? ThemeService().theme.colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: _generateExpansionTileWidget(),
      ),
    );
  }

  Widget _generateExpansionTileWidget() {
    return CustomExpansionPanelList.radio(
      dividerColor: null,
      elevation: 0,
      animationDuration: const Duration(milliseconds: 400),
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 0),
      iconSize: 18,
      // expandIconColor: Colors.blue,
      expansionCallback: (index, isExpand) {},
      children: widget.data.map<CustomExpansionPanelRadio>((ExpandListModel bean) {
        return CustomExpansionPanelRadio(
            expandBackgroundColor: widget.thumbColor ?? defaultColorScheme?.surfaceVariant,
            backgroundColor: widget.trackColor ?? defaultColorScheme?.background,
            canTapOnHeader: true,
            value: bean.value,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return SizedBox(
                height: 45,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    _buildHeadIcon(bean),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomText(bean.headTitle,style: TextStyle(color: widget.isNormal ? null : AppThemes.textColorGrey,fontWeight: FontWeight.w600)),
                  ],
                ),
              );
            },
            body: bean.item==null?const SizedBox():Column(
              children: List.generate(bean.item!.length, (insertIndex) {
                return Container(
                  decoration: BoxDecoration(
                    border: bean.item![insertIndex].showLine??false ? const Border(top: BorderSide(width: 2,color: AppThemes.lineGreen)) : const Border()
                  ),
                  height: 45,
                  child: InkWell(
                    onTap: () {
                      if (!widget.isNormal) {
                        return;
                      }
                      if (bean.showRadio) {
                        onChange(bean.item![insertIndex].itemId);
                      }
                      widget.onExpansionTap(bean.item![insertIndex]);
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Visibility(
                            visible: bean.showIcon ?? false,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                _buildItemIcon(bean,insertIndex),
                              ],
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          bean.item![insertIndex].itemTitle!,
                          style: TextStyle(color:widget.isNormal ? null : AppThemes.textColorGrey,fontWeight: FontWeight.w600)
                        ),
                        Expanded(child: Container()),
                        bean.showRadio
                            ? _colorfulCheckBox(bean.item![insertIndex].itemId)
                            : SizedBox(),
                        const SizedBox(
                          width: AppValues.smallMargin,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ));
      }).toList(),
    );
  }

  String chooseString = '';

  Widget _colorfulCheckBox(index) {
    return IgnorePointer(
      child: _colorPoint(
        value: index, //给每个radio设置一个标识 0，1，2，3
        groupValue: widget.type == 0 ? oddsId : langId, //已选中的radio的标识
        activeColor: defaultColorScheme?.inverseSurface,
      ),
    );
  }

  onChange(value) {
    if (mounted) {
      setState(() {
        widget.type == 0 ? oddsId = value : langId = value;
      });
    }
  }

  Widget _colorPoint({
    int value = 0,
    int groupValue = 0,
    Color? activeColor = Colors.white,
  }) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: groupValue == value ? AppThemes.lineGreen : Colors.transparent,
          border: Border.all(width: 2,color: AppThemes.lineGreen),
          borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.center,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: groupValue == value ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5)
        ),
        ),
      ),
    );
  }

  Widget _buildHeadIcon(ExpandListModel bean){
    if((bean.headNetIcon ?? '') .isNotEmpty){
      return CachedNetworkImage(imageUrl: AppValues.defaultBranch.asset_url+bean.headNetIcon!,width: 14,height: 14,
        color: widget.isNormal ? null : AppThemes.textColorGrey,
        errorWidget: (context, url, error) => CustomIcon(
          size: 14,
          asset: bean.headIcon!,
          color: widget.isNormal ? null : AppThemes.textColorGrey
      ),);
    }else{
      return  CustomIcon(
        size: 14,
        asset: bean.headIcon!,
        color: widget.isNormal ? null : AppThemes.textColorGrey
      );
    }
  }

  ///显示icon图片
  Widget _buildItemIcon(ExpandListModel bean,int index){
    if((bean.item![index].itemNetIcon??"").isNotEmpty){
      return CachedNetworkImage(imageUrl: AppValues.defaultBranch.asset_url+bean.item![index].itemNetIcon!,width: 14,height: 14,
        color: widget.isNormal ? null : AppThemes.textColorGrey,
        errorWidget: (context, url, error) => CustomAssetIcon(size: 14, name: bean.item![index].itemIcon!,
          color: widget.isNormal ? null : AppThemes.textColorGrey),);
    }else{
      return  CustomAssetIcon(size: 14, name: bean.item![index].itemIcon!,color: widget.isNormal ? null : AppThemes.textColorGrey);
    }
  }
}
