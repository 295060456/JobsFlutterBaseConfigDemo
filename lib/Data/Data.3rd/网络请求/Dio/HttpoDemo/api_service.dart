// 📁 lib/api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiService {
  static const String _defaultToken = 'Bearer sample_token_123';

  static Future<Map<String, dynamic>> request(
    String method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final mergedHeaders = {
      'Content-Type': 'application/json',
      'Authorization': _defaultToken,
      ...?headers,
    };

    final stopwatch = Stopwatch()..start();
    http.Response response;

    try {
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri, headers: mergedHeaders);
          break;
        case 'POST':
          response = await http.post(uri,
              headers: mergedHeaders, body: json.encode(body ?? {}));
          break;
        case 'PUT':
          response = await http.put(uri,
              headers: mergedHeaders, body: json.encode(body ?? {}));
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: mergedHeaders);
          break;
        case 'PATCH':
          response = await http.patch(uri,
              headers: mergedHeaders, body: json.encode(body ?? {}));
          break;
        case 'HEAD':
          final res = await http.head(uri, headers: mergedHeaders);
          stopwatch.stop();
          return {
            'statusCode': res.statusCode,
            'headers': res.headers,
            'durationMs': stopwatch.elapsedMilliseconds,
            'body': '(HEAD 请求无响应体)',
          };
        case 'OPTIONS':
          final req = http.Request('OPTIONS', uri)
            ..headers.addAll(mergedHeaders);
          final streamed = await req.send();
          stopwatch.stop();
          return {
            'statusCode': streamed.statusCode,
            'headers': streamed.headers,
            'durationMs': stopwatch.elapsedMilliseconds,
            'body': '(OPTIONS 请求无响应体)',
          };
        default:
          throw Exception('不支持的方法: $method');
      }

      stopwatch.stop();
      return {
        'statusCode': response.statusCode,
        'headers': response.headers,
        'durationMs': stopwatch.elapsedMilliseconds,
        'body': _parseBody(response),
      };
    } catch (e) {
      throw Exception('$method 请求异常: $e');
    }
  }

  static dynamic _parseBody(http.Response res) {
    try {
      return json.decode(res.body);
    } catch (_) {
      return res.body;
    }
  }

  static Future<String> uploadFile(String url, File file) async {
    final uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = _defaultToken
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('上传失败: ${response.statusCode}');
    }
  }

  static Future<String> downloadFile(String url, String filename) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('下载失败: ${response.statusCode}');
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);

    return file.path;
  }
}
