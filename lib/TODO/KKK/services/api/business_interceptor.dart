import 'dart:convert' as Convert;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:es_compression/zstd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_urls_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/routes/routes.dart';
import 'package:flutter_bet/services/api/http_status_code.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_bet/services/lang_service.dart';
import 'package:flutter_bet/utils/cbor_json_util.dart';
import 'package:flutter_bet/utils/encrypt_util.dart';
import 'package:flutter_bet/utils/lang_util.dart';
import 'package:flutter_bet/utils/zstd_flutter.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import '../account_service.dart';

class BusinessInterceptor extends Interceptor {
  ///下面两个接口后台数据是通过zstd压缩
  final String strPath = '/member/upload';//上传文件不验签
  final String strPath1 = '/member/game/lobby';//娱乐城大厅 zstd解压
  final String strPath2 = '/member/game/cate';//娱乐城分类 zstd解压

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers.addAll(generatorHeaderWithCommon());
    if (AccountService.sharedInstance.isLogin()) {
      if ((AppUrlsValues.encryption || AppUrlsValues.affidavit)&&!options.path.contains(strPath)) {
        options.headers.addAll({
          't': AccountService.sharedInstance.currentUser?.token,
          'time_zone': LangService.sharedInstance.lang.toTimeZoneValue,
          'X-Ca-Timestamp': formatDate(DateTime.now(), [D, ' ', M, ' ', d, ' ', yyyy]),
          'X-Ca-Nonce': getSign1(options.method,
              options.method == "GET" ? options.queryParameters : options.data, options.path),
        });
      } else {
        options.headers.addAll({
          't': AccountService.sharedInstance.currentUser?.token,
          'time_zone': LangService.sharedInstance.lang.toTimeZoneValue,
        });
      }
    } else {
      if ((AppUrlsValues.encryption || AppUrlsValues.affidavit)&&!options.path.contains(strPath)) {
        options.headers.addAll({
          'X-Ca-Timestamp': formatDate(DateTime.now(), [D, ' ', M, ' ', d, ' ', yyyy]),
          'X-Ca-Nonce': getSign1(options.method,
              options.method == "GET" ? options.queryParameters : options.data, options.path),
        });
      }
    }
    if (AppUrlsValues.encryption) {
      if (options.method == "POST") {
        List<int> newData = CborUtil.encodeJsonToCbor(options.data);
        // 将整数列表转换为对应的字符表示形式
        String strData = newData.map((e) => String.fromCharCode(e)).join('');
        options.data = strData;

        debugPrint('请求头body=${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    String json = '';
    if (isZstd(response)) {
      //todo 没有处理加密的问题
      try {
        json = await getZstdToJson(response);
      } catch (e) {
        json = "{\"status\":false,\"data\":404}";
        response.statusCode = HttpResponseStatus.NOT_FOUND;
      }
    } else {
      log('${response.realUri}${response.data.toString()}');
      if (AppUrlsValues.encryption) {
        json =
            response.data is Uint8List ? CborUtil.decodeCborToJson(response.data) : response.data();
      } else {
        json = response.data;
      }
    }

    Map<String, dynamic> map = Convert.jsonDecode(json.toString());

    if (map.isNotEmpty) {
      //未登录需要拦截一下
      if (map["status"] == false && map["data"] == "token") {
        //这里可以发消息，发完消息之后走success回调
        AccountService.sharedInstance.onUserTokenInvalid();
      } else if (map["status"] == false && map["data"] == "404") {
        var globalStateController = GlobalStateController.of();
        Future.delayed(const Duration(seconds: 1), () {
          if (!globalStateController.isRestrictedView.value) {
            Get.offAllNamed(Routes.RESTRICTED);
            globalStateController.isRestrictedView.value = true;
          }
        });
      }
    }
    response.data = map;
    handler.next(response);
  }

  /// 生成通用的http header
  Map<String, dynamic> generatorHeaderWithCommon() {
    return {
      'lang': LangUtil().getLangType(),
      'd': DeviceService.instance.getDeviceTypeNo(),
      // 'd': 24
    };
  }

  getSign1(method, Map params, String path) {
    String str = '';
    String seed = '24';
    String deviceType = DeviceService.instance.getDeviceTypeNo();
    String timeStamp = formatDate(DateTime.now(), [D, ' ', M, ' ', d, ' ', yyyy]);
    String finalStr = '';

    if (method == 'GET') {
      if (params.isEmpty) {
        str = path;
      } else {
        if (!path.contains("?")) {
          str = '$path?${preData(params)}';
        } else {
          str = '$path&${preData(params)}';
        }
      }
      finalStr = '$deviceType$timeStamp$str';
    } else {
      String base64String;
      //只有加密的时候再给传参生成cbor后转成base64
      if (AppUrlsValues.encryption) {
        List<int> cborData = CborUtil.encodeJsonToCbor(params);
        base64String = EncryptUtil.cborToBase64(cborData);
      } else {
        base64String = base64.encode(utf8.encode(jsonEncode(params)));
      }
      finalStr = '$base64String$deviceType$timeStamp$path';
    }
    print('finalStr response.验签=$finalStr');
    String signString = EncryptUtil.encodeJsonToHash(finalStr, int.parse(seed));
    return signString.toString();
  }

  String preData(params) {
    List str = [];

    params.forEach((k, v) {
      if (v != null) {
        str.add('$k=$v');
      }
    });

    return str.join('&');
  }

  ///接口数据是否通过zstd压缩
  bool isZstd(Response response) {
    String urlPath = response.realUri.toString();
    if (urlPath.contains(strPath1)) {
      return true;
    } else if (urlPath.contains(strPath2)) {
      if (!urlPath.contains('/games')) {
        return true;
      }
    }
    return false;
  }

  ///接口数据做zstd解压处理
  Future<String> getZstdToJson(Response response) async {
    if (Platform.isAndroid) {
      return await androidZstdHandle(response);
    } else {
      return iosZstdHandle(response);
    }
  }

  ///android做zstd解压处理
  Future<String> androidZstdHandle(Response response) async {
    try {
      int size = await ZstdFlutter.decompressed_size(response.data);
      Uint8List ori2 = await ZstdFlutter.decompress(response.data, size);
      return utf8.decode(ori2);
    } on PlatformException {
      log('-------获取到json=zstd数据异常=${response.realUri}');
      Uint8List compressedData = Uint8List.fromList(response.data);
      return utf8.decode(compressedData);
    }
  }

  ///ios做zstd解压处理
  String iosZstdHandle(Response response) {
    try {
      // Zstd压缩的字节数组
      List<int> compressedData = response.data;
      // 解压缩数据
      List<int> decompressedData = ZstdCodec().decode(compressedData);
      // 将解压缩后的数据转换为JSON
      return utf8.decode(decompressedData);
    } on FormatException catch (e) {
      log('-------获取到json=zstd数据异常=${response.realUri}');
      Uint8List compressedData = Uint8List.fromList(response.data);
      return utf8.decode(compressedData);
    }
  }
}
