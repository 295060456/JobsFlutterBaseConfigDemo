import 'mqtt_topic.dart';

class MqttStateManager {
  bool isRequestingSubscribeAdTopic = false;
  bool isSubscribedAdTopic = false;
  static String onDisconnectedStr = '-1';

  /// 包含订阅和取消订阅
  onPrepareSubscribeOrUnsubscribe(String? topic) {
    if (topic == MqttTopic.adTopic) {
      isRequestingSubscribeAdTopic = true;
    }
  }

  onSubscribeFinish(String? topic, bool isSubscribeSuccess) {
    if (topic == MqttTopic.adTopic || topic == onDisconnectedStr) {
      isRequestingSubscribeAdTopic = false;
    }
    if(topic == MqttTopic.adTopic || topic == onDisconnectedStr){
      isSubscribedAdTopic = isSubscribeSuccess;
    }
  }

  bool canSubscribeAdTopic() {
    return !isRequestingSubscribeAdTopic && !isSubscribedAdTopic;
  }


  bool canUnSubscribeAdTopic() {
    return !isRequestingSubscribeAdTopic && isSubscribedAdTopic;
  }
}
