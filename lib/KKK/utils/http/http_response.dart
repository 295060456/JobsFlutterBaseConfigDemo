
import 'exception/http_exceptions.dart';

class HttpResponse {
  late bool ok; //HttpResponseStatus.SUCESS 是否是200
  dynamic? data;
  final bool statusOk; //200 下，也有可能是true 或者 false
  String? msg;
  HttpException? error;

  HttpResponse._internal(this.statusOk, {this.ok = false});

  HttpResponse.success(this.data, this.statusOk, this.msg) {
    ok = true;
  }

  HttpResponse.failure({String? errorMsg, int? errorCode,this.statusOk = false}) {
    error = BadRequestException(message: errorMsg, code: errorCode);
    ok = false;
  }

  HttpResponse.failureFormResponse({dynamic? data,this.statusOk = false}) {
    error = BadResponseException(data);
    ok = false;
  }

  HttpResponse.failureFromError(this.statusOk, [HttpException? error]) {
    error = error ?? UnknownException();
    ok = false;
  }

  @override
  String toString() {
    return 'HttpResponse{ok: $ok, data: $data, statusOk: $statusOk, msg: $msg, error: $error}';
  }
}