import 'dart:convert';
import 'package:cbor/cbor.dart';
import 'dart:convert' as Convert;

class CborUtil {
  static List<int> encodeJsonToCbor(jsonString) {
    // 创建CBOR编解码器
    // final cbor = cborEncode();

    // JSON字符串
    // final jsonString = '{"name": "John", "age": 30, "city": "New York"}';

    // 将JSON字符串解析为Map
    // final jsonMap = json.decode(jsonString.);
    Map<String, dynamic> jsonMap =
        jsonString is Map<String, String> ? jsonString : Convert.jsonDecode(jsonString.toString());

    // 将Map转换为CBOR字节流
    final cborBytes = cbor.encode(CborValue(jsonMap));

    return cborBytes;
  }

  static void decodeJsonToCbor() {}
  static void encodecborToJson() {}

  static String decodeCborToJson(cborBytes) {
    // 如果需要，你也可以将CBOR字节流转换回Map
    // print('Decoded Map: 开始');
    // print(cborBytes);
    CborValue decodedMap = cbor.decode(cborBytes);
    // 打印解码后的Map
    // print('Decoded Map: ' + decodedMap.toJson().toString());

    // 将CborValue对象转换为Map对象
    dynamic dartObject = decodedMap.toObject();
    // 在键名前后添加引号
    String jsonString = jsonEncode(dartObject);

    return jsonString;
  }
}
