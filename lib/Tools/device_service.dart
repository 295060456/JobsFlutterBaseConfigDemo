import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'SPUtil.dart';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter_bet/constant/app_cache_key.dart';
// import 'package:flutter_bet/utils/sp_util.dart';
// import 'package:platform_device_id/platform_device_id.dart';
// import 'package:uuid/uuid.dart';

// import '../widget/refresh/widget/cupertino/easy_refresh_path.dart';

class DeviceService {
  static DeviceService? _instance;

  static DeviceService _getInstance() {
    _instance ??= DeviceService();
    return _instance!;
  }

  static DeviceService get instance => _getInstance();

  String? deviceId;
  String? deviceTypeNo;
  String _clientId = '';
  final uuid = const Uuid();

  String getClientId() {
    if (_clientId.isEmpty) {
      final cache = SPUtil().getString("clientIdKey");
      if (cache == null) {
        _clientId = uuid.v4();
        SPUtil().setString("clientIdKey", _clientId);
      } else {
        _clientId = cache;
      }
    }
    return _clientId;
  }

  String getDeviceId() {
    if (deviceId == null || deviceId?.isEmpty == true) {
      deviceId = SPUtil().get<String>('flutter_device_id');
      if (deviceId == null) {
        deviceId = _generateRandomString(32);
        SPUtil().setString('flutter_device_id', deviceId);
      }
    }
    return deviceId ?? '';
  }

  ///提前获取设备信息
  getAdvanceDeviceId() async {
    if (deviceId == null || deviceId?.isEmpty == true) {
      deviceId = SPUtil().get<String>('flutter_device_id');
      if (deviceId == null) {
        try {
          if (Platform.isIOS) {
            // Flutter 中的方法通道
            const platform = MethodChannel('udid_events');
            String udid = "";
            try {
              udid = await platform.invokeMethod('udid_events_ios', {'message': ""});
              deviceId = udid;
            } catch (e) {
              deviceId = await PlatformDeviceId.getDeviceId;
            }
          } else {
            deviceId = await PlatformDeviceId.getDeviceId;
          }
        } on PlatformException {
          deviceId ??= _generateRandomString(32);
        }
        SPUtil().setString('flutter_device_id', deviceId);
      }
    }
  }

  String getDeviceTypeNo() {
    if (deviceTypeNo == null) {
      if (Platform.isAndroid) {
        deviceTypeNo = '26';
      } else if (Platform.isIOS) {
        deviceTypeNo = '27';
      } else if (kIsWeb) {
        deviceTypeNo = '25';
      } else {
        deviceTypeNo = '24';
      }
    }
    return deviceTypeNo!;
  }

  String _generateRandomString(int length) {
    final random = Random();
    const availableChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString =
        List.generate(length, (index) => availableChars[random.nextInt(availableChars.length)])
            .join();

    return randomString;
  }
}
