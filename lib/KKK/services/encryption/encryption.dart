import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/macs/poly1305.dart';
import 'package:pointycastle/stream/chacha20.dart';
import 'package:crypto/crypto.dart'; // 用于生成哈希

///数据加密ChaCha20/Poly1305
class Encryption {
  // final _key = Uint8List.fromList(List<int>.generate(32, (i) => i));
  final _key = '12345678';
  final _nonce = Uint8List.fromList(List<int>.generate(8, (i) => i));

  factory Encryption() => _getInstance()!;

  static Encryption? get instance => _getInstance();
  static Encryption? _instance;

  final Dio _dio = Dio();

  static Encryption? _getInstance() {
    _instance ??= Encryption._internal();
    return _instance;
  }

  // 创建 ChaCha20Poly1305 加密器
  final cipher = ChaCha20Engine();
  final poly1305 = Poly1305();

  Encryption._internal() {
    _init();
  }

  _init() async {
    _dio.options.baseUrl = 'http://www.tfdjqp.com:7080/'; // 替换为你的API基础URL
  }

  ///数据加密
  Uint8List encrypt(Uint8List plaintext) {
    final key = generateKeyFromString(_key);
    cipher.init(true, ParametersWithIV(KeyParameter(key), _nonce));
    final ciphertext = Uint8List(plaintext.length);
    cipher.processBytes(plaintext, 0, plaintext.length, ciphertext, 0);
    return ciphertext;
  }


  ///数据解密
  Uint8List decrypt(Uint8List ciphertext) {
    final key = generateKeyFromString(_key);
    cipher.init(false, ParametersWithIV(KeyParameter(key), _nonce));
    final decryptedText = Uint8List(ciphertext.length);
    cipher.processBytes(ciphertext, 0, ciphertext.length, decryptedText, 0);
    return decryptedText;
  }

  Uint8List generateKeyFromString(String input) {
    final hash = sha256.convert(utf8.encode(input));
    return Uint8List.fromList(hash.bytes);
  }



  Future<Response> getData(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint,options: Options(responseType: ResponseType.bytes),);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

}
