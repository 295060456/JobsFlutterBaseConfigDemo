import '../../../pages/sport/common_model/sport_common_params.dart';

///体育赛事 盘口 显示状态描述
class SportOddDescModel {
  String? label;
  int statusCode; //盘口状态
  SportHandicapApiType handicapType;

  SportOddDescModel({required this.statusCode})
      : handicapType = SportHandicapApiType.checkHandicap(statusCode);
}
