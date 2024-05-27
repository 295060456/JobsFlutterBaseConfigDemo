import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// 这段代码演示了如何使用 MQTT 协议连接到代理，发布消息，并订阅主题以接收消息。
// 通过设置不同的回调函数，可以在连接、断开连接、订阅和订阅失败时执行特定操作。
// 程序通过监听主题的更新，实时接收并处理来自代理的消息。
void main() async {
  // 创建客户端
  final client = MqttServerClient('test.mosquitto.org', 'flutter_client');
  // 设置客户端选项和回调
  client.logging(on: true);// 开启日志记录
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  // 配置连接消息
  final connMessage = MqttConnectMessage()
      // 设置客户端标识符。
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      // 启动清洁会话。
      .startClean()
      // 设置 QoS 等级为“至少一次”。
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMessage;
  // 尝试连接到代理。如果连接失败，捕获异常并断开连接。
  try {
    await client.connect();
  } catch (e) {
    debugPrint('Exception: $e');
    client.disconnect();
  }
  // 检查连接状态并执行订阅和发布
  // 检查连接状态是否成功。
  // 成功连接后，订阅 test/topic 主题，QoS 等级为“至少一次”。
  // 使用 MqttClientPayloadBuilder 构建消息 Hello MQTT 并发布到 test/topic 主题。
  // 监听消息更新，接收订阅主题的消息并打印。
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    debugPrint('MQTT client connected');
    client.subscribe('test/topic', MqttQos.atLeastOnce);

    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello MQTT');
    client.publishMessage('test/topic', MqttQos.atLeastOnce, builder.payload!);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      debugPrint('Received message: $pt from topic: ${c[0].topic}>');
    });
  } else {
    debugPrint('ERROR: MQTT client connection failed - status is ${client.connectionStatus}');
  }
}
// 设置连接
void onConnected() {
  debugPrint('Connected');
}
// 断开连接
void onDisconnected() {
  debugPrint('Disconnected');
}
// 订阅成功
void onSubscribed(String topic) {
  debugPrint('Subscribed to $topic');
}
// 订阅失败
void onSubscribeFail(String topic) {
  debugPrint('Failed to subscribe $topic');
}
