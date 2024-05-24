

import 'package:telnet/telnet.dart';

///获取可用域名
class AvailableDomainUtil {

  /// 获取可用域名
  static Future<String> getWsRomain(List<String> romainList) async {
    String mqttDomain = '';
    bool isConnect = false;
    for (int i = 0; i < romainList.length; i++) {
      if (!isConnect) {
        await _connect(ip: romainList[i]).then((value) async {
          if (value && !isConnect) {
            isConnect = true;
            mqttDomain = romainList[i];
            return romainList[i];
          }
        });
      }
    }
    return mqttDomain;
  }

  static Future<bool> _connect({String ip = '43.198.7.164:1883'}) async {
    print('链接中。。。。。。ipr=$ip');
    try {
      List<String> ipr = ip.split(':');
      final task = TelnetClient.startConnect(
        host: ipr[0],
        port: int.parse(ipr[1]),
        timeout: const Duration(seconds: 3),
        onError: (e, b) {
          print('链接失败。。。。。。 $e $b');
        },
        onDone: (e) {
          print('链接成功。。。。。。 $e');
        },
        onEvent: (e, b) {
          print('链接中。。。。。。 $e $b');
        },
      );
      await task.waitDone();
      final client = task.client;
      return client != null;
    } catch (e) {
      print('链接失败 $ip');
      return false;
    }
  }
}