import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bet/model/notifis/notification.dart';
import 'package:flutter_bet/model/notifis/announcement.dart';
import 'package:flutter_bet/model/notifis/feedback.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import '../../../model/page.dart';
import '../../../utils/http/http_engine.dart';
import '../api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image/image.dart';

extension NotifsApiService on ApiService {
  /// 消息列表
  Future<HttpResponse> notificationsList({
    required int pageSize,
    required int page,
    required Success<PageModel<NotifsInfo>> success,
    required Fail fail,
  }) async {
    String path = "/member/notifications?page=$page&page_size=$pageSize";
    HttpResponse response = await $engine?.execute(Method.GET, path, data: {});
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<NotifsInfo>.fromJson(
            response.data, (json) => NotifsInfo.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///新通知
  Future<HttpResponse> notificationsCount({
    required Success<Map> success,
    required Fail fail,
  }) async {
    String path = "/member/notifications/count";
    HttpResponse response = await $engine?.execute(Method.GET, path, data: {});
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

  /// 通知已读
  /// id == "" ? "全部已读" : 单条已读
  Future<HttpResponse> notificationsMsgState({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    const allUrl = "/member/notifications/read/all";
    const idUrl = "/member/notifications/read";
    String path = id == "" ? allUrl : idUrl;
    final data = id == "" ? {} : {"id": id};
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
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

  /// 通知删除
  Future<HttpResponse> notificationsMsgDelete({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    final idUrl = "/member/notifications/delete?id=$id";
    HttpResponse response =
    await $engine?.execute(Method.GET, idUrl, data: {});
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

  /// 站内信
  Future<HttpResponse> inboxMsgList({
    required int pageSize,
    required int page,
    required Success<PageModel<AnnouncementModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/station/info/list?page=$page&page_size=$pageSize";
    HttpResponse response = await $engine?.execute(Method.GET, path, data: {});
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<AnnouncementModel>.fromJson(
            response.data, (json) => AnnouncementModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 站内信已读
  /// id == "" ? "全部已读" : 单条已读
  Future<HttpResponse> inboxMsgState({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    const allUrl = "/member/station/info/detail/update/all/state";
    final idUrl = "/member/station/info/detail/update/state?id=$id";
    String path = id.isEmpty ? allUrl : idUrl;
    HttpResponse response =
        await $engine?.execute(id.isEmpty ? Method.GET : Method.POST, path, data: {});
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

  /// 站内信删除
  Future<HttpResponse> inboxMsgDelete({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    final idUrl = "/member/station/info/detail/delete?id=$id";
    HttpResponse response =
    await $engine?.execute(Method.GET, idUrl, data: {});
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

  /// 公告1/跑马灯2 列表
  Future<HttpResponse> announcementList({
    required String typeCode,
    required int pageSize,
    required int page,
    required Success<PageModel<AnnouncementModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/notice/list?types=$typeCode&location=notification&page=$page&page_size=$pageSize";
    HttpResponse response = await $engine?.execute(Method.GET, path, data: {});
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<AnnouncementModel>.fromJson(
            response.data, (json) => AnnouncementModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 公告已读
  Future<HttpResponse> announcementState({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    final idUrl = "/member/notice/read/insert?id=$id";
    HttpResponse response =
    await $engine?.execute(Method.GET, idUrl, data: {});
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

  /// 公告1 关闭
  Future<HttpResponse> noticeLimit({
    required int types,
    required List<String> ids,
    required Success<String> success,
    required Fail fail,
  }) async {
    final param = {"types": types, "ids": ids};
    String path = "/member/notice/limit/count";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  /*
  * ---------------------------反馈---------------------------
  * */

  /// 新增建议反馈
  Future<HttpResponse> feedbackInsert({
    required String description,
    required String images,
    required Success<String> success,
    required Fail fail,
  }) async {
    var param = {
      "images": images,
      "description": description,
    };
    String path = "/member/feedback/insert";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  /// 待领取金额
  Future<HttpResponse> feedbackBonusReward({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/feedback/bonus/reward";
    HttpResponse response = await $engine?.execute(Method.GET, path, data: {});
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

  /// 金额领取
  /// id 为空一键领取所有
  /// coinId 币种ID
  Future<HttpResponse> feedbackBonusDraw({
    required String feedId,
    required String coinId,
    required Success<String> success,
    required Fail fail,
  }) async {
    final param = {"feed_id": feedId, "cur": coinId};
    String path = "/member/feedback/bonus/draw";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  /// 反馈列表
  Future<HttpResponse> feedbackList({
    required Success<PageModel> success,
    required Fail fail,
  }) async {
    String path = "/member/feedback/list";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: {});
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<FeedbackModel>.fromJson(
            response.data, (json) => FeedbackModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 反馈列表为已读
  Future<HttpResponse> feedbackUpdate({
    required String id,
    required Success<String> success,
    required Fail fail,
  }) async {
    final param = {
      "id": id,
    };
    String path = "/member/feedback/update";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  /// 反馈消息详情
  Future<HttpResponse> feedbackDetail({
    required String id,
    required Success<List<FeedbackMessageModel>> success,
    required Fail fail,
  }) async {
    final param = {
      "feed_id": id,
    };
    String path = "/member/feedback/chat/list";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
    if (response.ok) {
      if (response.statusOk) {
        List<FeedbackMessageModel> infos = [];
        final list = response.data;
        if (list != null && (list is List) && list.isNotEmpty) {
          for (var obj in list) {
            final model = FeedbackMessageModel.fromJson(obj);
            infos.add(model!);
          }
        }

        success(infos);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 聊天发送反馈消息
  Future<HttpResponse> feedbackChatInsert({
    required String id,
    required String text,
    required Success<String> success,
    required Fail fail,
  }) async {
    final param = {
      "feed_id": id,
      "content": text,
    };
    String path = "/member/feedback/chat/insert";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  /// 图像文件上传
  Future<HttpResponse> uploadImg({
    required AssetEntity asset,
    required Success<String> success,
    required Fail fail,
  }) async {
    var param = dio.FormData.fromMap({
      "upload_type": 1,
      "upload_file": await multipartFileFromAssetEntity(asset),
    });

    String path = "/member/upload";
    Options options = dio.Options(headers: {'Content-Type': 'multipart/form-data'});
    HttpResponse response =
        await $engine?.execute(Method.POST, path, data: param, options: options);
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

  Future<dio.MultipartFile> multipartFileFromAssetEntity(AssetEntity entity) async {
    dio.MultipartFile mf;
    // Using the file path.
    final file = await entity.file;
    if (file == null) {
      throw StateError('Unable to obtain file of the entity ${entity.id}.');
    }

    Image? image = decodeImage(file!.readAsBytesSync());
    if (image == null) {
      throw StateError('Unable to obtain image of the entity {entity.id}.');
    }

    // 大图缩放图像尺寸,  目标宽度 <= 800
    int targetWidth = image.width < 800 ? image.width : 800;
    // 计算目标高度，保持宽高比
    int targetHeight = (image.height * targetWidth / image.width).round();
    // 按比例调整图像尺寸
    Image resizedImage = copyResize(image, width: targetWidth, height: targetHeight);

    // 设置目标字节大小 < 500kb
    int targetSizeInBytes = 500 * 1024;

    // 图像字节 > 目标字节大小, 压缩图像质量
    List<int> jpgData = [];
    if (resizedImage.lengthInBytes > targetSizeInBytes) {
      int currentQuality = 90;
      while (currentQuality > 10) {
        jpgData = encodeJpg(resizedImage, quality: currentQuality);
        print("${jpgData.length / 1024} kb");
        if (jpgData.length > targetSizeInBytes) {
          currentQuality -= 10;
        } else {
          break;
        }
      }
    }

    mf = dio.MultipartFile.fromBytes(jpgData,
        filename: '${DateTime.now().microsecondsSinceEpoch}.jpg');
    print("${mf.filename} === 图像大小 ==== ${mf.length / 1024} kb");
    return mf;
  }
}
