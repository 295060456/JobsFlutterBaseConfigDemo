import 'package:flutter/cupertino.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import '../../../pages/sport/common_model/sport_common_params.dart';
import '../custom_sport_mixin/custom_sport_bet_mixin.dart';
import '../custom_sport_odd_type.dart';
import 'custom_sport_odd_status.dart';

class CustomSportOddButtonV extends StatefulWidget with CustomSportBetMixin {
  final OddCountType type;
  final SportBetClick sportBetClick;
  OddStatusType statusType;
  int section;
  int row;
  int colum;
  M e;
  SportHandicapApiType stateType; //盘口状态

  CustomSportOddButtonV(
      this.e, this.type, this.statusType, this.sportBetClick, this.section, this.row, this.colum,
      {Key? key, required this.stateType})
      : super(key: key);

  @override
  State<CustomSportOddButtonV> createState() => _CustomSportOddButtonVState();
}

class _CustomSportOddButtonVState extends State<CustomSportOddButtonV> with CustomSportBetMixin {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      onPressed: () {
        // if (widget.statusType == OddStatusType.close ||
        //     widget.statusType == OddStatusType.settled) {
        //   return;
        // }

        //todo: [widget.e.mls] 接口是没有返回这个字段的
        // if (widget.e.mls != 1) {
        //   return;
        // }
        if (!SportHandicapApiType.isCanClick(widget.stateType)) {
          return;
        }

        betOrder(widget.e);

        widget.sportBetClick(SportClikType.odd, widget.section, widget.row, widget.colum,
            widget.e?.si ?? 0, widget.e.ei.toString());
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        // Get the size of the current widget
        final widgetSize = Size(
          renderBox.paintBounds.width,
          renderBox.paintBounds.height,
        );

        // if not in bet

        showButtonAnimation(context, position, widgetSize, widget.e.isChoose == false);

        setState(() {
          // widget.statusType = (widget.statusType == OddStatusType.seletcted)
          //     ? OddStatusType.unSeletcted
          //     : OddStatusType.seletcted;
          widget.statusType =
              (widget.e.isChoose == false) ? OddStatusType.unSeletcted : OddStatusType.seletcted;
        });
      },
      child: CustomOddStatusWidget(widget.e, widget.type, widget.statusType, handicapStateType: widget.stateType),
    );
  }
}
