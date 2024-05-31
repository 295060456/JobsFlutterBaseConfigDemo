import 'package:flutter_bet/model/chat_message.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/services/chat_room_service.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/json_util.dart';
import 'package:flutter_bet/utils/secret_util.dart';

extension IMApiService on ApiService {
  Future<HttpResponse> sendMessage({
    required String msg,
    required Success<String> success,
    required Fail fail,
  }) async {
    final s = '${DeviceService.instance.getClientId()}|${DateTime.now().microsecondsSinceEpoch}';
    final body = {"c": msg, "s": s};
    String path = "/member/chat/send?lang=${ChatRoomService.sharedInstance.getChannel.lang}";
    HttpResponse response =
        await $engine?.execute(Method.POST, path, data: body);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getChatRoomHistoryList({
    required Success<List<ChatMessageModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/chat/history/list";
    var params = {"lang": ChatRoomService.sharedInstance.getChannel.lang};
    HttpResponse response =
        await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      final pageModel = JsonUtil.getObjectList(
          response.data, (v) => ChatMessageModel.fromJson(v));
      success(pageModel ?? []);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }
}
