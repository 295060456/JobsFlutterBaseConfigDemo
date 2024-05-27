import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mqtt_manager.dart';
// MQTT (Message Queuing Telemetry Transport) 是一种轻量级的、基于发布/订阅模式的消息协议，专为低带宽和高延迟的网络环境设计
// 广泛应用于物联网 (IoT) 设备之间的通信，如智能家居、智能车载系统、智能手机、智能穿戴设备等。

// 关键特点
// 轻量级：MQTT 协议非常小巧，适合嵌入式设备和带宽受限的网络。
// 发布/订阅模式：MQTT 使用发布/订阅消息模式，而不是传统的客户端-服务器模式，这使得它更适合动态变化的拓扑结构。
// 低带宽消耗：由于其轻量级的消息头部，MQTT 对网络带宽的消耗非常低。
// 可靠性：MQTT 提供了多种服务质量 (QoS) 等级，以满足不同应用的可靠性需求。

// 关键概念
// 客户端：任何连接到 MQTT 代理的设备或应用程序。客户端可以是发布者、订阅者或两者兼而有之。
// 代理 (Broker)：负责接收来自发布者的消息，并将这些消息分发给订阅了相应主题的客户端。代理在 MQTT 中起到核心作用。
// 主题 (Topic)：消息的分类机制。发布者将消息发布到特定主题，订阅者则订阅感兴趣的主题，从而接收相关的消息。主题使用层级结构，以斜杠 (/) 分隔，例如 home/livingroom/temperature。
// 消息：实际传输的数据负载。消息包括一个主题和一个有效负载（可以是任意二进制数据）。
// QoS (服务质量)：MQTT 提供三种服务质量等级，以确保消息传递的可靠性：
// QoS 0：最多一次传输，消息可能会丢失或重复。
// QoS 1：至少一次传输，消息可能会重复但不会丢失。
// QoS 2：恰好一次传输，确保消息既不丢失也不重复。

// 使用场景
// 物联网 (IoT)：由于其低带宽消耗和可靠性，MQTT 被广泛应用于物联网设备之间的通信，如传感器网络、智能家居和工业自动化。
// 移动应用：适用于需要低功耗和低延迟的移动设备通信。
// 实时消息传递：如实时数据流、实时监控和报警系统。

// 工作流程示例
// 一个传感器客户端将温度数据发布到主题 home/livingroom/temperature。
// 任何订阅了 home/livingroom/temperature 主题的客户端将接收到该温度数据。
// 代理负责接收发布者的消息并分发给所有订阅了该主题的订阅者。

// 这个示例应用程序展示了如何在 Flutter 中使用 mqtt_client 库来实现 MQTT 通信。
// 它连接到一个 MQTT 代理，订阅一个主题，并允许用户通过简单的界面发布消息。
// 通过 Provider 管理状态，可以实时更新 UI 以反映连接状态和消息传递情况。
// 主页面 (main.dart)：提供用户界面，允许用户查看连接状态并发布消息。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MqttManager('test.mosquitto.org', 'flutter_client'),
        ),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqttManager = Provider.of<MqttManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Client Demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              // 显示 MQTT 连接状态（已连接或已断开）。
              child: Text(
                mqttManager.isConnected ? 'Connected' : 'Disconnected',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // 用户输入要发布的消息。
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // 点击按钮发布消息到 test/topic 主题。
            child: ElevatedButton(
              onPressed: () {
                mqttManager.publish('test/topic', _controller.text);
              },
              child: const Text('Publish'),
            ),
          ),
        ],
      ),
    );
  }
}
