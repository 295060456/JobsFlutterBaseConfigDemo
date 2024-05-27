import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// 以下是一个简单的 MQTT 发布和订阅示例，展示了如何使用 mqtt_client 库进行连接和消息传递：
// 这个示例展示了如何使用 MQTT 协议连接到代理，发布消息，并订阅主题以接收消息。
void main() async {
  final client = MqttServerClient('test.mosquitto.org', 'flutter_client');

  client.logging(on: true);
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;

  final connMessage = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMessage;

  try {
    await client.connect();
  } catch (e) {
    debugPrint('Exception: $e');
    client.disconnect();
  }

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

void onConnected() {
  debugPrint('Connected');
}

void onDisconnected() {
  debugPrint('Disconnected');
}

void onSubscribed(String topic) {
  debugPrint('Subscribed to $topic');
}

void onSubscribeFail(String topic) {
  debugPrint('Failed to subscribe $topic');
}
