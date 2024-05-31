import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/pages/main/logic.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:flutter_bet/widget/sport/until/custom_sport_until.dart';
import 'package:get/get.dart';
import '../../constant/app_urls_values.dart';
import '../../pages/sport/sport_detail/model.dart';
import '../../routes/routes.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/route_util.dart';
import '../custom_asset_icon.dart';
import 'package:intl/intl.dart';
import 'custom_sport_mixin/custom_sport_bet_mixin.dart';

class CustomSportHot extends StatefulWidget {
  const CustomSportHot(this.list, {super.key});

  final List<SportMatchModel> list;

  @override
  State<CustomSportHot> createState() => _CustomSportHotState();
}

class _CustomSportHotState extends State<CustomSportHot> {
  final GlobalStateController globalController = Get.find<GlobalStateController>();
  final MainLogic logic = Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding,vertical: AppValues.defaultMargin),
      child: SizedBox(
        height: 134,
        // color: Colors.amber,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            return cards(index,widget.list[index]);
          },
        ),
      ),
    );
  }

  Widget cards(int index,SportMatchModel model) {
    return GestureDetector(
      onTap: () => RouteUtil.pushToView(Routes.sport_detail, arguments: {'si': model.si, 'eid': model.ei}),
      child: Container(
        width: 270,
        height: 134,
        margin: EdgeInsets.only(right: index != widget.list.length - 1 ? AppValues.halfMargin : 0),
        padding: const EdgeInsets.symmetric(horizontal: AppValues.halfMargin,vertical: AppValues.padding_10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppValues.smallRadius),
          color: ThemeService().theme.colorScheme.surfaceVariant,
        ),
        child: Column(
          children: [
            titleWidget(model),
            const SizedBox(height: AppValues.halfPadding,),
            Container(
              height: 1,
              color: ThemeService().colorScheme.tertiary,
            ),
            const SizedBox(height: AppValues.smallRadius,),
            teamsWidget(model),
            const SizedBox(height: AppValues.smallRadius,),
            scoreWidget(model)
          ],
        ),
      ),
    );
  }

  Widget titleWidget(SportMatchModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(dateTimeToString((model.ed??0)),style: const TextStyle(fontSize: 12,color: AppThemes.textColorSecondary,fontWeight: FontWeight.w600),),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppValues.smallPadding),
            child: SizedBox(
              height: 18,
              child: CustomText(model.cn ?? '',maxLines: 1,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
            )
          )
        ),
        SizedBox(
          // width: 73,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 17,
                padding: const EdgeInsets.symmetric(horizontal: AppValues.halfPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ThemeService().colorScheme.tertiary
                ),
                alignment: Alignment.center,
                child: CustomText(model.ml!.length.toString(),style: const TextStyle(fontSize: 12,color: AppThemes.textColorSecondary,fontWeight: FontWeight.w600),),
              ),
              const SizedBox(width: AppValues.smallRadius,),
              const CustomAssetIcon(
                size: 10,
                name: 'assets/images/common/ic_common_arrow_right.webp',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget teamsWidget(SportMatchModel model) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              CustomNetWorkImage(
                imageUrl: '${AppUrlsValues.envConfig.asset_url}${model.htpic}',
                width: 26,
                height: 26,
                placeholder: Image.asset(
                  SportUntil().tabImage(true, 999),
                  width: 26,
                  height: 26,
                ),
                errorWidget: Image.asset(
                  SportUntil().tabImage(true, 999),
                  width: 26,
                  height: 26,
                ),
              ),
              const SizedBox(height: AppValues.smallRadius,),
              SizedBox(
                height: 18,
                child: CustomText(model.htn!,maxLines: 1,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              )
            ],
          ),
        ),
        SizedBox(
          width: 62,
          child: Column(
            children: [
              const SizedBox(height: AppValues.smallRadius,),
              const CustomText('VS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              CustomText(S.current.random_text_1174,style: const TextStyle(fontSize: 12,color: AppThemes.textColorSecondary,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              CustomNetWorkImage(
                imageUrl: '${AppUrlsValues.envConfig.asset_url}${model.atpic}',
                width: 26,
                height: 26,
                placeholder: Image.asset(
                  SportUntil().tabImage(true, 999),
                  width: 26,
                  height: 26,
                ),
                errorWidget: Image.asset(
                  SportUntil().tabImage(true, 999),
                  width: 26,
                  height: 26,
                ),
              ),
              const SizedBox(height: AppValues.smallRadius,),
              SizedBox(
                height: 18,
                child: CustomText(model.atn!,maxLines: 1,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget scoreWidget(SportMatchModel model) {
    var list = [];
    for (var element in model.ml!) {
      if (element.bt == 1 && element.egi == 1) {
        list = element.ms!;
      }
    }
    return Row(
      children: [
        ScoreItem(list.first),
        const SizedBox(width: 14,),
        ScoreItem(list.last),
      ],
    );
  }
}

class ScoreItem extends StatefulWidget {
  const ScoreItem(this.model, {super.key});

  final M model;

  @override
  State<ScoreItem> createState() => _ScoreItemState();
}

class _ScoreItemState extends State<ScoreItem> with CustomSportBetMixin {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // if (!SportHandicapApiType.isCanClick(widget.stateType)) {
          //   return;
          // }

          betOrder(widget.model);

          // widget.sportBetClick(SportClikType.odd, widget.section, widget.row, widget.colum,
          //     widget.e?.si ?? 0, widget.e.ei.toString());
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);

          // Get the size of the current widget
          final widgetSize = Size(
            renderBox.paintBounds.width,
            renderBox.paintBounds.height,
          );

          // // if not in bet

          showButtonAnimation(context, position, widgetSize, widget.model.isChoose == false);

          setState(() {
            // model.isChoose = !model.isChoose!;
            // (widget.e.isChoose == false) ? OddStatusType.unSeletcted : OddStatusType.seletcted;
          });
        },
        child: Container(
          height: 33,
          padding: const EdgeInsets.symmetric(horizontal: AppValues.halfPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.smallRadius),
            color: widget.model.isChoose == true ? ThemeService().theme.colorScheme.primary : ThemeService().theme.colorScheme.onPrimaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(widget.model.hdp??'0',style: TextStyle(fontSize: 12,color: widget.model.isChoose == true ? ThemeService().theme.colorScheme.surface : AppThemes.textColorWhite,fontWeight: FontWeight.w600),),
              CustomText(widget.model.ov??'0',style: TextStyle(fontSize: 12,color: widget.model.isChoose == true ? AppThemes.textColorWhite : AppThemes.secondaryColor,fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      )
    );
  }
}

String dateTimeToString(int timestamp) {
  return DateFormat('MM-dd hh:mm').format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)).toString();
}