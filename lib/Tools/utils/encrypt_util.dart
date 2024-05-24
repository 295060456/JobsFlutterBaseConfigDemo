import 'dart:convert';
import 'dart:typed_data';

import 'package:murmur3/murmur3.dart';
import 'package:murmurhash/murmurhash.dart';

class EncryptUtil {
  static encodeJsonToCbor(jsonString) async {
    print('');
    final hash32 = murmur3a('div200').toHex(32);
    print('murmur3a(\'div2000\') = 0x$hash32');

    final hash128x64 = murmur3f('div200').toHex(128);
    print('murmur3f(\'div2000\') = 0x$hash128x64');

    final pkBytes = Stream.fromIterable([0x08, 'div200', 0x00]);
    final pkHash = encodeHash((await murmur3a(pkBytes)).toDouble());
    print('div200 pk hash = ${pkHash.map((b) => b.toHex(8)).join()}');
    print('');
  }

  static int decodeJsonToCbor(String key, int seed) {
    return murmurhash3_32_gc(key, seed);
  }

  static String encodeJsonToHash(String key, int seed) {
    String s = MurmurHash.v3(key, seed).toString();
    return s.toString();
  }

  ///cbor buffer转base64
  static String arrayBufferToBase64(ByteBuffer buffer) {
    List<int> bytes = buffer.asUint8List();
    String binary = String.fromCharCodes(bytes);
    return base64.encode(binary.codeUnits);
  }

  ///cbor 转base64
  static String cborToBase64(List<int> bytes) {
    String binary = String.fromCharCodes(bytes);
    return base64.encode(binary.codeUnits);
  }

// static String decodeCborToJson(cborBytes) {}
}

final mask64bit = BigInt.parse('0xFFFFFFFFFFFFFFFF');
final max = BigInt.parse('9223372036854775808');

List<int> encodeHash(double value) {
  var buffer = <int>[];
  buffer.add(0x05);
  var num = encodeDoubleAsUInt64(value);
  buffer.add((num >> 0x38).toInt() & 0xFF);
  num = (num << 8) & mask64bit;
  var num2 = 0;
  var flag = true;
  do {
    if (!flag) {
      buffer.add(num2);
    } else {
      flag = false;
    }
    num2 = ((num >> 0x38).toInt() & 0xFF) | 0x01;
    num = (num << 7) & mask64bit;
  } while (num != BigInt.zero);
  buffer.add(num2 & 0xFE);
  return buffer;
}

BigInt encodeDoubleAsUInt64(double value) {
  final dl = Float64List.fromList([value]);
  var bytes = dl.buffer.asUint8List();
  if (Endian.host == Endian.big) {
    bytes = Uint8List.fromList(bytes.reversed.toList());
  }

  var idx = 8;
  var hi = 0;
  while (idx > 4) {
    idx--;
    hi = (hi << 8) | bytes[idx];
  }
  var lo = 0;
  while (idx > 0) {
    idx--;
    lo = (lo << 8) | bytes[idx];
  }

  final num = (BigInt.from(hi) << 32) | BigInt.from(lo);
  return (num >= max) ? (~num + BigInt.one) : (num ^ max);
}

extension IntHexExt on dynamic {
  toHex(int bits) => toRadixString(16).padLeft(bits ~/ 4, '0').toUpperCase();
}

int murmurhash3_32_gc(String key, int seed) {
  int remainder, bytes, h1, h1b, c1, c1b, c2, c2b, k1, i;

  remainder = key.length % 4;
  bytes = key.length - remainder;
  h1 = seed;
  c1 = 0xcc9e2d51;
  c2 = 0x1b873593;
  i = 0;

  while (i < bytes) {
    k1 = (key.codeUnitAt(i) & 0xff) |
        ((key.codeUnitAt(i + 1) & 0xff) << 8) |
        ((key.codeUnitAt(i + 2) & 0xff) << 16) |
        ((key.codeUnitAt(i + 3) & 0xff) << 24);

    k1 = ((k1 & 0xffff) * c1 + ((((k1 >> 16) * c1) & 0xffff) << 16)) & 0xffffffff;
    k1 = (k1 << 15) | (k1 >> 17);
    k1 = ((k1 & 0xffff) * c2 + ((((k1 >> 16) * c2) & 0xffff) << 16)) & 0xffffffff;

    h1 ^= k1;
    h1 = (h1 << 13) | (h1 >> 19);
    h1 = ((h1 & 0xffff) * 5 + ((((h1 >> 16) * 5) & 0xffff) << 16)) & 0xffffffff;
    h1 = (h1 & 0xffff) + 0x6b64 + ((((h1 >> 16) + 0xe654) & 0xffff) << 16);

    i += 4;
  }

  k1 = 0;

  switch (remainder) {
    case 3:
      k1 ^= (key.codeUnitAt(i + 2) & 0xff) << 16;
      break;
    case 2:
      k1 ^= (key.codeUnitAt(i + 1) & 0xff) << 8;
      break;
    case 1:
      k1 ^= key.codeUnitAt(i) & 0xff;

      k1 = ((k1 & 0xffff) * c1 + ((((k1 >> 16) * c1) & 0xffff) << 16)) & 0xffffffff;
      k1 = (k1 << 15) | (k1 >> 17);
      k1 = ((k1 & 0xffff) * c2 + ((((k1 >> 16) * c2) & 0xffff) << 16)) & 0xffffffff;
      h1 ^= k1;
  }

  h1 ^= key.length;

  h1 ^= h1 >> 16;
  h1 = ((h1 & 0xffff) * 0x85ebca6b + ((((h1 >> 16) * 0x85ebca6b) & 0xffff) << 16)) & 0xffffffff;
  h1 ^= h1 >> 13;
  h1 = ((h1 & 0xffff) * 0xc2b2ae35 + ((((h1 >> 16) * 0xc2b2ae35) & 0xffff) << 16)) & 0xffffffff;
  h1 ^= h1 >> 16;

  return h1;
}
