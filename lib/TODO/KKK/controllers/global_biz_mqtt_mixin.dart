import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../pages/betting/common_model/betting_race_api_model.dart';
import '../pages/betting/common_model/betting_record_api_model.dart';
import '../services/mqtt/mqtt_service.dart';
import '../utils/deposit_withdrawal_notification_util.dart';
import '../utils/json_util.dart';
import 'global_biz_base_mixin.dart';

///消息处理
mixin GlobalBizMqttMixin {
  ///娱乐城所有投注
  final mqttCasinoAllRankingObs = <BettingRecordApiModel>[].obs;

  ///娱乐城风云榜
  final mqttCasinoStormRankingObs = <BettingRecordApiModel>[].obs;

  ///娱乐城竞赛排行榜
  final mqttCasinoRaceRankingObs = <BettingRaceApiModel>[].obs;

  ///处理娱乐城 所有投注
  void dealMqttCasinoAllRanking(MqttMessageEvent event) {
    //{qos: 1, retain: false, topic: dev/member/bet/zh/casino/all, payload: null, clientid: 291425234604195393}
    // var payload = json.decode(event.message);
    var payload = event.message;
    if (payload != null) {
      var modelList = JsonUtil.getObjectList<BettingRecordApiModel>(
        payload,
        (v) => BettingRecordApiModel.fromJson(v),
      );
      // log('接收获取娱乐城 所有投注有数据更新=${JsonUtil.encodeObj(modelList)}');
      mqttCasinoAllRankingObs.assignAll(modelList ?? []);
    }
  }

  ///处理娱乐城风云榜
  void dealMqttCasinoStormRanking(MqttMessageEvent event) {
    //{qos: 1, retain: false, topic: dev/member/bet/zh/casino/all, payload: null, clientid: 291425234604195393}
    // var payload = json.decode(event.message);
    var payload = event.message;
    if (payload != null) {
      var modelList = JsonUtil.getObjectList<BettingRecordApiModel>(
        payload,
        (v) => BettingRecordApiModel.fromJson(v),
      );
      // log('接收获取娱乐城 风云榜有数据更新=${JsonUtil.encodeObj(modelList)}');
      mqttCasinoStormRankingObs.assignAll(modelList ?? []);
    }
  }

  ///处理娱乐城竞赛排行榜
  void dealMqttCasinoRaceRanking(MqttMessageEvent event) {
    //{qos: 1, retain: false, topic: dev/member/bet/zh/casino/all, payload: null, clientid: 291425234604195393}
    // var payload = json.decode(event.message);
    var payload = event.message;
    if (payload != null) {
      var modelList = JsonUtil.getObjectList<BettingRaceApiModel>(
        payload,
        (v) => BettingRaceApiModel.fromJson(v),
      );
      log('接收获取娱乐城 竞赛排行榜有数据更新=${JsonUtil.encodeObj(modelList)}');
      mqttCasinoRaceRankingObs.assignAll(modelList ?? []);
    }
  }

  /*================================= 消息通知 =================================*/
  final newNotice       = false.obs;
  final newNoticeUpdate = 0.obs;

  ///处理 消息通知
  void dealMqttMessageNotify(MqttMessageEvent event) async {
    print('收到第三方通知消息=${event.message}');
    newNotice.value = true;
    newNoticeUpdate.value = DateTime.now().millisecondsSinceEpoch;
    await Future.delayed(const Duration(milliseconds: 100));
    DepositWithdrawalNotifUtils.showNotificationPop(event.message);
  }
}
