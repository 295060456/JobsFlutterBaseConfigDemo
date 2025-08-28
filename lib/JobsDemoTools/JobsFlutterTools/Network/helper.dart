import 'dart:convert';
import 'dart:typed_data';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/Network/des.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/AnyExtensions/onNum.dart';
import 'package:pointycastle/export.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

Map<String, dynamic> finalHeaders(
    Map<String, dynamic> inHeaders, String signature) {
  Map<String, dynamic> headers = {};
  // let tid = 0;
  // const tenantState = useTenantStore();
  // if (tenantState.tenantInfo && tenantState.tenantInfo.tid) {
  //   tid = tenantState.tenantInfo.tid;
  // }
  headers['Tid'] = 0;

  // let Custid = 0;
  // const userStore = useUserStore();
  // if (userStore.userInfo && userStore.userInfo.cust_id) {
  //   Custid = userStore.userInfo.cust_id;
  // }
  // if (Custid) {
  //   headers.Custid = Custid;
  // }
  headers['Custid'] = '';
  headers['Content-Type'] = 'application/x-www-form-urlencoded';
  headers['Accept'] =
      'application/json, application/xml, text/play, text/html, *.*';
  headers['Signature'] = md5.convert(utf8.encode(signature)).toString();
  headers.addAll(inHeaders);
  return headers;
}

Map<String, dynamic> getNormalHeaders(int cmdId) {
  Map<String, dynamic> headers = {};
  const grantType = 'password';
  const scope = 'read write';

  headers['Cmdid'] = cmdId;
  headers['Custid'] = '';
  headers['Aseqid'] = '1';
  String signature =
      'react_clientgrant_type=${grantType}scope=${scope}cmd_id=${cmdId}react';
  return finalHeaders(headers, signature);
}

String enP(String rk, String vk, int t) {
  String enc = des(vk, '$rk$t', true, 0, '', 1);
  return base64Encode(latin1.encode(enc));
}

String dnP(String vk, String str) {
  String s = latin1.decode(base64Decode(str));
  return des(vk, s, false, 0, '', 1);
}

String enD(String rk, String str) {
  String enc = des(rk, str, true, 0, '', 1);
  return base64Encode(latin1.encode(enc));
}

String dnD(String rk, String str) {
  String s = latin1.decode(base64Decode(str));
  return des(rk, s, false, 0, '', 1);
}

String enC(String rk, String vk, String m) {
  var combinedMessage = utf8.encode(m + rk);
  var hmac = Hmac(md5, utf8.encode(vk));
  var digest = hmac.convert(combinedMessage);
  var base64Str = base64.encode(digest.bytes);
  return base64Str;
}

String formatSendData(dynamic data, [int type = 0]) {
  if (type == 0) {
    if (data is! Map<String, dynamic>) {
      throw ArgumentError('Type 0 requires a Map<String, dynamic> as input.');
    }
    List<String> arr = [];
    data.forEach((key, value) {
      if (value is List) {
        for (var subValue in value) {
          arr.add('$key[]=$subValue');
        }
      } else {
        arr.add('$key=$value');
      }
    });
    return arr.join('&');
  } else if (type == 2) {
    if (data is List<String>) {
      return data.join('/');
    } else if (data is List<int>) {
      return data.map((e) => e.toString()).join('/');
    } else {
      throw ArgumentError('Type 2 requires a List<String> as input.');
    }
  }
  return jsonEncode(data);
}

String getP(String p) {
  var hmac = Hmac(md5, utf8.encode('7NEkojNzfkk='));
  var digest = hmac.convert(utf8.encode(p));
  return digest.toString();
}

int ensureInt(dynamic value) {
  if (value is int) {
    return value;
  } else if (value is String) {
    return int.tryParse(value) ?? 0; // 尝试转换字符串为整数，转换失败返回默认值 0
  } else {
    return 0; // 非法类型返回默认值 0
  }
}

String formatDoubleToThreeDecimals(double value, {int fixed = 3}) {
  // 使用 truncateToFixed 保留最多 3 位小数
  if (value.abs() < 0.001) {
    return "0";
  }
  String formatted = value.truncateToFixed(fixed);

  // 移除无意义的尾随零
  if (formatted.contains('.')) {
    formatted = formatted.replaceAllMapped(
        RegExp(r'(\.\d*?[1-9])0+$|\.0+$'), (match) => match.group(1) ?? '');
  }
  return formatted;
}

String decrypt3DES(String cipherText) {
  // 处理密钥
  Uint8List keyData = utf8.encode('xxx');
  int len = keyData.length;
  Uint8List keyBytes = Uint8List(24);
  for (int i = 0; i < (len > 24 ? 24 : len); i++) {
    keyBytes[i] = keyData[i];
  }
  // 创建3DES密钥参数
  final key = KeyParameter(keyBytes);
  // 初始化PaddedBlockCipher（ECB模式 + PKCS7填充）
  final paddedCipher = PaddedBlockCipherImpl(
    PKCS7Padding(),
    ECBBlockCipher(DESedeEngine()),
  );
  // 初始化解密器，参数为PaddedBlockCipherParameters
  paddedCipher.init(
    false, // false表示解密模式
    PaddedBlockCipherParameters<KeyParameter, Null>(key, null),
  );
  // 将密文转换为字节数组
  Uint8List cipherTextBytes = base64.decode(cipherText);
  // 执行解密
  Uint8List decryptedBytes = paddedCipher.process(cipherTextBytes);
  // 将解密后的字节转换为字符串
  return utf8.decode(decryptedBytes);
}

String decryptDomain(String data) {
  final key = encrypt.Key.fromUtf8('djskenrmchdjwksl');
  final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
  return encrypter.decrypt(encrypt.Encrypted.from64(data),
      iv: encrypt.IV.fromLength(16));
}
