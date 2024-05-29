import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/http/http_transformer.dart';
import 'package:flutter_bet/utils/json_util.dart';
import 'http_status_code.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    // TODO: implement parse
    Map dataMap;
    if(response.data is String) {
      dataMap = json.decode(response.data);
    }else{
      dataMap = response.data;
    }
    if (response.statusCode == HttpResponseStatus.SUCESS) {
      return HttpResponse.success(dataMap["data"], dataMap['status'], dataMap['msg']);
    } else {
      return HttpResponse.failure(errorMsg: dataMap["msg"], errorCode: dataMap["code"]);
    }
  }
}
