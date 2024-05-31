import 'dart:core';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/chat_room_service.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_ulog/flutter_ulog.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'mqtt_core.dart';
import 'mqtt_topic.dart';

class MqttService {
  /// 使用单例模式来实现Mqtt连接，避免多次连接
  late MqttCore mClient;

  factory MqttService() => _getInstance()!;

  static MqttService? get instance => _getInstance();
  static MqttService? _instance;
  final listeners = <MqttServiceListener>[];
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  static MqttService? _getInstance() {
    _instance ??= MqttService._internal();
    return _instance;
  }

  MqttService._internal() {
    _init();
  }

  _init() async {
    mClient = MqttCore();
  }

  ///连接
  connectMqtt() {
    mClient.connectMqtt();
  }

  ///订阅
  _subscribe(String topic) {
    mClient.subscribe(topic);
  }

  ///取消订阅
  _unsubscribe(String topic) {
    mClient.unsubscribe(topic);
  }

  ///断开
  disconnect() {
    mClient.disconnect();
  }

  subscribeAd() {
    if (!mClient.mqttStateManager.canSubscribeAdTopic()) {
      ULog.d("Ad topic 正在请求订阅，或者已经订阅，不能再次订阅...");
      return;
    }
    String topic = MqttTopic.adTopic;
    _subscribe(topic);
  }

  unsubscribeAd() {
    if (!mClient.mqttStateManager.canUnSubscribeAdTopic()) {
      ULog.d("Ad topic 正在请求订阅/取消订阅/还未订阅，不能取消订阅...");
      return;
    }
    String topic = MqttTopic.adTopic;
    _unsubscribe(topic);
  }

  subscribeWithDraw() {
    // var gc = Get.find<GlobalStateController>();
    // 订阅名称，由站点前缀_uid_finance
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      String subName = '${account.uid}/${account.uid}/finance';
      MqttTopic.withDrawTopic = subName;
      String topic = MqttTopic.withDrawTopic;
      _subscribe(topic);
    }
  }

  unsubscribeWithDraw() {
    String topic = MqttTopic.withDrawTopic;
    _unsubscribe(topic);
  }

  ///订阅用户余额 推送
  subscribeBalance() {
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      // 订阅名称，由站点前缀_uid_finance
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/balance/${account.uid}';
      MqttTopic.balanceTopic = subName;
      String topic = MqttTopic.balanceTopic;
      _subscribe(topic);
    }
  }

  ///订阅用户邮箱验证推送
  subscribeMember() {
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      // 订阅名称，由站点前缀_uid_finance
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/member/${account.uid}';
      MqttTopic.memberTopic = subName;
      String topic = MqttTopic.memberTopic;
      _subscribe(topic);
    }
  }

 ///订阅用户第三方推送
  subscribeMemberGoogle() async {
    final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/auth/${DeviceService.instance.getDeviceId()}';
      MqttTopic.thirdLoginTopic = subName;
      String topic = MqttTopic.thirdLoginTopic;
      _subscribe(topic);
  }

  ///取消订阅订阅用户第三方推送
  unsubscribeMemberGoogle() {
    String topic = MqttTopic.thirdLoginTopic;
    _unsubscribe(topic);
  }

 ///订阅用户通知推送
  subscribeNotifyTopic() async {
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/member/notifications/${account.uid}';
      MqttTopic.notifyTopic = subName;
      String topic = MqttTopic.notifyTopic;
      _subscribe(topic);
    }
  }

  ///取消订阅通知推送
  unsubscribeNotifyTopic() {
    String topic = MqttTopic.notifyTopic;
    _unsubscribe(topic);
  }

 ///订阅获取所有投注 风云榜 数据推送消息
  subscribeRankingListTopic() async {
      final prefix = AppValues.defaultBranch.ws_prefix;
      ///所有投注 娱乐城
      String subCasinoAllName = '$prefix/member/bet/${globalController.getLangSimpleString()}/casino/all';
      MqttTopic.rankingAllCasinoTopic = subCasinoAllName;
      String topicCasinoAllName = MqttTopic.rankingAllCasinoTopic;
      _subscribe(topicCasinoAllName);

      ///所有投注 体育
      String subSportsAllName = '$prefix/member/bet/${globalController.getLangSimpleString()}/sports/all';
      MqttTopic.rankingAllSportsTopic = subSportsAllName;
      String topicSportsAll = MqttTopic.rankingAllSportsTopic;
      _subscribe(topicSportsAll);

      ///风云榜 娱乐城
      String subCasinoFyName = '$prefix/member/bet/${globalController.getLangSimpleString()}/casino/fy';
      MqttTopic.rankingListCasinoTopic = subCasinoFyName;
      String topicCasinoFy = MqttTopic.rankingListCasinoTopic;
      _subscribe(topicCasinoFy);

      ///风云榜 体育
      String subSportsFyName = '$prefix/member/bet/${globalController.getLangSimpleString()}/sports/fy';
      MqttTopic.rankingListSportsTopic= subSportsFyName;
      String topicSportsFy = MqttTopic.rankingListSportsTopic;
      _subscribe(topicSportsFy);
  }

  ///取消订阅获取所有投注 风云榜 排行榜数据推送消息
  unsubscribeRankingListTopic() {
    String topicCasinoAllName = MqttTopic.rankingAllCasinoTopic;
    _unsubscribe(topicCasinoAllName);
    String topicSportsAll = MqttTopic.rankingAllSportsTopic;
    _unsubscribe(topicSportsAll);
    String topicCasinoFy = MqttTopic.rankingListCasinoTopic;
    _unsubscribe(topicCasinoFy);
    String topicSportsFy = MqttTopic.rankingListSportsTopic;
    _unsubscribe(topicSportsFy);
  }

 ///订阅后台配置登录注册改动推送消息
  subscribeLoginRegTopic() async {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/member/brand/detail';
      MqttTopic.loginRegTopic= subName;
      String topic = MqttTopic.loginRegTopic;
      _subscribe(topic);
  }

  ///取消订阅后台配置登录注册改动推送消息
  unsubscribeLoginRegTopic() {
    String topic = MqttTopic.loginRegTopic;
    _unsubscribe(topic);
  }

 ///订阅入款卡/支付方式/支付方法/通道等有变动时推送消息
  subscribeDepositFlushTopic() async {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/deposit/flush';
      MqttTopic.depositFlushTopic = subName;
      String topic = MqttTopic.depositFlushTopic;
      _subscribe(topic);
  }

  ///取消订阅入款卡/支付方式/支付方法/通道等有变动时推送消息
  unsubscribeDepositFlushTopic() {
    String topic = MqttTopic.depositFlushTopic;
    _unsubscribe(topic);
  }

 ///订阅获取活动100推送消息
  subscribeActivity100Topic() async {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/member/active/carousel';
      MqttTopic.activity100Topic = subName;
      String topic = MqttTopic.activity100Topic;
      _subscribe(topic);
  }

  ///取消订阅获取活动100推送消息
  unsubscribeActivity100Topic() {
    String topic = MqttTopic.activity100Topic;
    _unsubscribe(topic);
  }

 ///订阅获取活动100 状态改变 推送消息
  subscribeActivity100StateTopic() async {
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/promo/turntable/${account.uid}';
      MqttTopic.activity100StateTopic = subName;
      String topic = MqttTopic.activity100StateTopic;
      _subscribe(topic);
    }
  }

  ///取消订阅获取活动100 状态改变 推送消息
  unsubscribeActivity100StateTopic() {
    String topic = MqttTopic.activity100StateTopic;
    _unsubscribe(topic);
  }

 ///订阅删除聊天消息的 推送消息
  subscribeMsgDelTopic() async {
      final prefix = AppValues.defaultBranch.ws_prefix;
      String subName = '$prefix/chat/del';
      MqttTopic.delMsgTopic = subName;
      String topic = MqttTopic.delMsgTopic;
      _subscribe(topic);
  }

  ///取消订阅删除聊天消息的 推送消息
  unsubscribeMsgDelTopic() {
    String topic = MqttTopic.delMsgTopic;
    _unsubscribe(topic);
  }

  ///取消订阅获取 体育 推送消息
  subscribeSport() {
    final prefix = AppValues.defaultBranch.ws_prefix;
      // String subName = '$prefix/sport/delta/${globaController.getLangString()}';
    String subName = 'sport/delta/${globalController.getLangString()}';
    MqttTopic.sportTopic = subName;
      String topic = MqttTopic.sportTopic;
      _subscribe(topic);
  }

  ///取消订阅余额推送
  unsubscribeBalance() {
    String topic = MqttTopic.balanceTopic;
    _unsubscribe(topic);
  }

  ///取消订阅用户邮箱验证推送
  unsubscribeMember() {
    String topic = MqttTopic.memberTopic;
    _unsubscribe(topic);
  }

  subscribeNotice() {
    final account = AccountService.sharedInstance.currentUser;
    if (account != null) {
      // 订阅名称，由站点前缀_uid_finance
      String subName = '${account.uid}/${account.uid}/finance';
      MqttTopic.withDrawTopic = subName;
      String topic = MqttTopic.withDrawTopic;
      _subscribe(topic);
    }
  }

  unsubscribeNotice() {
    String topic = MqttTopic.withDrawTopic;
    _unsubscribe(topic);
  }

  subscribeBet(String subTopic) {
    if (MqttTopic.betTopic == subTopic) {
      //防止重复订阅
      return;
    }
    MqttTopic.betTopic = subTopic;
    _subscribe(subTopic);
  }

  unsubscribeBet() {
    String topic = MqttTopic.betTopic;
    _unsubscribe(topic);
  }

  subscribeChat(ChatRoomChannelModel model) {
    _subscribe(model.topicName);
  }

  unsubscribeChat(ChatRoomChannelModel model) {
    _unsubscribe(model.topicName);
  }

  Future<void> addListener(MqttServiceListener listener) async {
    if (listeners.contains(listener)) return;
    listeners.add(listener);
  }

  Future<void> removeListener(MqttServiceListener listener) async {
    if (!listeners.contains(listener)) return;
    listeners.remove(listener);
  }

  Future<void> dispatchReceiveMessageEvent(MqttMessageEvent event) async {
    for (MqttServiceListener listener in listeners) {
      if (listener.onReceiveMessage != null) {
        listener.onReceiveMessage!(event);
      }
    }
  }

  Future<void> dispatchStatusChangeEvent(MqttStatusEvent event) async {
    for (MqttServiceListener listener in listeners) {
      if (listener.onStatusChange != null) {
        listener.onStatusChange!(event);
      }
    }
  }


}

typedef MqttServiceOnReceiveMessage = void Function(MqttMessageEvent event);
typedef MqttServiceOnStatusChange = void Function(MqttStatusEvent event);

class MqttServiceListener {
  MqttServiceOnReceiveMessage? onReceiveMessage;
  MqttServiceOnStatusChange? onStatusChange;

  MqttServiceListener({
    this.onReceiveMessage,
    this.onStatusChange,
  });
}

///消息获取
class MqttMessageEvent {
  MqttMessageTypes messageType;
  dynamic message;
  List<MqttReceivedMessage<MqttMessage?>>? originalMessage;

  MqttMessageEvent(this.messageType, this.message, {this.originalMessage});
}

///广播监听 连接状态
class MqttStatusEvent {
  int status = -1;

  MqttStatusEvent(this.status);
}