import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_bet/utils/available_domain_util.dart';
import 'package:flutter_ulog/flutter_ulog.dart';
import 'package:get/get.dart';
import 'mqtt_service.dart';
import 'mqtt_state_manager.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'mqtt_topic.dart';

/// 使用单例模式来实现Mqtt连接，避免多次连接
class MqttCore {
  late final MqttServerClient client;
  int pongCount = 0;
  bool isConnected = false;

  ///mqtt 连接账号
  final mqttUsername = '';

  ///mqtt 连接密码
  final mqttPassword = '';

  MqttCore._internal() {
    _init();
  }

  factory MqttCore() => _instance;

  static final MqttCore _instance = MqttCore._internal();

  _init() async {
    String romain = GlobalStateController.of().mqttRomain;
    print('----能用的ws地址=$romain');
    if (romain.contains(':')) {
      client = MqttServerClient(romain.split(':')[0], '');
      client.logging(on: false);
      var port = int.parse(romain.split(':')[1]);
      client.port = port;
      client.setProtocolV311();
      print('----能用的ws域名地址=${romain.split(':')[0]}---端口号=$port');

      /// 如果你打算使用保持活动，你必须在这里设置它，否则保持活动将被禁用。
      client.keepAlivePeriod = 20;
      client.disconnectOnNoResponsePeriod = 20;
      client.autoReconnect = true;
      client.onDisconnected = onDisconnected;
      client.onConnected = onConnected;
      client.onSubscribed = onSubscribed;
      client.onUnsubscribed = onUnsubscribed;

      /// 如果需要，设置一个 ping 接收回调，每当收到 ping 响应（pong）时调用
      client.pongCallback = pong;

      ULog.d('Mqtt 初始化完成  port: $port');
    }
  }

  /// 链接mqtt
  Future<void> connectMqtt() async {
    if (isConnected) return;
    final account = AccountService.sharedInstance.currentUser;
    try {
      var clientId = account?.uid ?? getDefaultClientId();
      await connectWithMessage(clientId: clientId);
    } catch (e, stack) {
      ULog.e('$e $stack');
    }
  }

  // mqtt message 设置
  Future<MqttServerClient> connectWithMessage({
    String clientId = '',
  }) async {
    try {
      if (isConnected) {
        await disconnect();
      }
      final connMess = MqttConnectMessage()
          .authenticateAs(mqttUsername, mqttPassword)
          .withClientIdentifier(clientId)
          .withWillTopic('willtopic') // If you set this you must set a will message
          .withWillMessage('My Will message')
          .startClean() // Non persistent session for testing
          .withWillQos(MqttQos.exactlyOnce);
      ULog.d('准备链接 mqtt: username:$mqttUsername password:$mqttPassword clientId:$clientId');
      client.connectionMessage = connMess;
      await _startConnect();
      setListener();
    } catch (e, stack) {
      ULog.d('mqtt 客户端连接失败 - $e  $stack');
      disconnect();
    }
    return client;
  }

  _startConnect() async {
    try {
      await client.connect();
    } catch (e, stack) {
      ULog.e("mqtt : $e $stack");
    }
  }

  disconnect() {
    ULog.d('mqtt ::准备断开连接');
    try {
      isConnected = false;
      client.disconnect();
    } catch (e, stack) {
      ULog.e("断开 mqtt 异常： $e  $stack");
    }
  }

  MqttStateManager mqttStateManager = MqttStateManager();

  void subscribe(String topic) async {
    ULog.d('mqtt 订阅主题 topic $topic');
    try {
      if (!isConnected) {
        ULog.d("收到订阅主题请求  mqtt 还没有链接 开始链接...");
        await connectMqtt();
      }
      mqttStateManager.onPrepareSubscribeOrUnsubscribe(topic);
      var subscribe = client.subscribe(topic, MqttQos.exactlyOnce);
      ULog.d("订阅结果 subscribe: ${subscribe?.topic}");
    } catch (e, stack) {
      mqttStateManager.onSubscribeFinish(topic, false);
      ULog.e("订阅 mqtt 异常：topic $topic  $e  $stack");
    }
  }

  unsubscribe(String topic) {
    ULog.d('mqtt ::准备取消订阅主题 topic $topic');
    try {
      mqttStateManager.onPrepareSubscribeOrUnsubscribe(topic);
      client.unsubscribe(topic);
    } catch (e, stack) {
      ULog.e("取消订阅 mqtt 异常： $e  $stack");
    }
  }

  void onDisconnected() {
    if (isConnected) {
      isConnected = false;
      mqttStateManager.onSubscribeFinish(MqttStateManager.onDisconnectedStr, false);
      MqttService.instance?.dispatchStatusChangeEvent(MqttStatusEvent(2));
      ULog.d('mqtt ::OnDisconnected 客户端回调 - 客户端断开连接');
      if (client.connectionStatus!.disconnectionOrigin == MqttDisconnectionOrigin.solicited) {
        ULog.d('mqtt ::OnDisconnected 回调被请求，这是正确的');
      }
    }
  }

  void onConnected() {
    if (!isConnected) {
      isConnected = true;
      MqttService.instance?.dispatchStatusChangeEvent(MqttStatusEvent(1));
      ULog.d('mqtt OnConnected 客户端连接成功');
    }
  }

  void setListener() {
    try {
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? receive) {
        try {
          if (receive == null || receive.isEmpty) {
            return;
          }
          // return;///添加此行 调试的时候用，不接收任何mqtt消息
          final recMess = receive![0].payload as MqttPublishMessage;

          /// 有效载荷是一个字节缓冲区，这将特定于主题
          // print('mqtt 示例::更改通知:: topic is ${receive[0].topic}, payload is :: ${recMess.payload.message}');
          if (receive[0].topic == MqttTopic.balanceTopic) {
            print("下发通知 ${MqttTopic.balanceTopic}");
            MqttService.instance?.dispatchReceiveMessageEvent(
                MqttMessageEvent(MqttMessageTypes.messageBalance, null));
          } else if (receive[0].topic == MqttTopic.memberTopic) {
            ///个人信息更新邮箱绑定
            MqttService.instance?.dispatchReceiveMessageEvent(
                MqttMessageEvent(MqttMessageTypes.messageMember, null));
          } else if (receive[0].topic == MqttTopic.loginRegTopic) {
            ///获取后台配置登录注册改动推送消息
            MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                MqttMessageTypes.messageLoginReg, 'loginReg',
                originalMessage: receive));
          } else if (receive[0].topic == MqttTopic.sportTopic) {
            if (recMess.payload.message is Map) {
              // 对象是Map类型
              // print('对象是Map类型');
            } else {
              Uint8List uint8List = Uint8List.fromList(recMess.payload.message);
              String jsonString = utf8.decode(uint8List);
              Map<String, dynamic> jsonMap = json.decode(jsonString);
              final GlobalStateController globalController = Get.find<GlobalStateController>();
              globalController.sportData.value = jsonMap;
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageSport, null));
              // print('对象不是Map类型');
            }
          } else {
            Uint8List uint8List = Uint8List.fromList(recMess.payload.message);
            String jsonString = utf8.decode(uint8List);
            var msg = json.decode(jsonString);
            // print('mqtt 示例::更改通知:: topic is ${receive[0].topic}, payload is :: $msg');
            if (receive[0].topic == MqttTopic.thirdLoginTopic) {
              ///三方登录
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageThirdLogin, msg));
            } else if (receive[0].topic == MqttTopic.withDrawTopic) {
              //ty 1为充值；2为提现；3为紧急站内信
              if (msg['ty'] == '1') {
                MqttService.instance?.dispatchReceiveMessageEvent(
                    MqttMessageEvent(MqttMessageTypes.messageDeposit, msg));
              } else if (msg['ty'] == '2') {
                MqttService.instance?.dispatchReceiveMessageEvent(
                    MqttMessageEvent(MqttMessageTypes.messageWithdraw, msg));
              } else if (msg['ty'] == '3') {
                MqttService.instance?.dispatchReceiveMessageEvent(
                    MqttMessageEvent(MqttMessageTypes.messageNotice, msg));
              }
            } else if (receive[0].topic == MqttTopic.betTopic) {
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageBet, msg, originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.notifyTopic) {
              ///通知消息
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageNotify, msg, originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.rankingAllCasinoTopic) {
              ///获取所有投注 娱乐城
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageRankingAllCasino, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.rankingAllSportsTopic) {
              ///获取所有投注 体育
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageRankingAllSports, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.rankingListCasinoTopic) {
              ///获取所风云榜 娱乐城
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageRankingListCasino, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.rankingListSportsTopic) {
              ///获取风云榜 体育
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageRankingListSports, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.depositFlushTopic) {
              ///获取入款卡/支付方式/支付方法/通道等有变动时推送消息
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageDepositFlush, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.activity100Topic) {
              ///获取活动100推送消息
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageActivity100, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.activity100StateTopic) {
              ///获取活动100 状态改变 推送消息
              MqttService.instance?.dispatchReceiveMessageEvent(MqttMessageEvent(
                  MqttMessageTypes.messageActivity100State, msg,
                  originalMessage: receive));
            } else if (receive[0].topic == MqttTopic.delMsgTopic) {
              ///获取 删除聊天消息 推送消息
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageDelMsg, msg, originalMessage: receive));
            } else {
              MqttService.instance?.dispatchReceiveMessageEvent(
                  MqttMessageEvent(MqttMessageTypes.messageChat, msg, originalMessage: receive));
            }
          }
        } catch (e, stack) {
          ULog.e("$e  $stack");
        }
      });
    } catch (e, stack) {
      ULog.e("$e  $stack");
    }
  }

  void onSubscribed(String topic) {
    mqttStateManager.onSubscribeFinish(topic, true);
    ULog.d('mqtt::已成功订阅 $topic');
  }

  void onUnsubscribed(String? topic) {
    mqttStateManager.onSubscribeFinish(topic, false);
    ULog.d('mqtt::取消订阅成功 $topic ');
  }

  void pong() {
    /// 检查我们是否已连接
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      pongCount++;
      ULog.d('mqtt::Ping 响应客户端回调调用 mqtt pongCount：$pongCount');
    } else {
      ULog.d('mqtt::ERROR Mosquitto 客户端连接失败 - 断开连接，状态为 ${client.connectionStatus}');
      isConnected = false;
      disconnect();
      _startConnect();
    }
  }

  ///没登录情况下获取ClientId
  String getDefaultClientId() {
    String deviceId = DeviceService.instance.getDeviceId();
    String clientId = '${Platform.isAndroid ? 'Android' : 'IOS'}-$deviceId';
    return clientId;
  }
}
