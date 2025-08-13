import 'dart:convert';
import 'package:flutter/foundation.dart';
/// 命名po，延续iOS开发中打印对象的方法命名的传统
void po(
  dynamic input, {
  String? path, // 点语法: 't.actionCfg.gameType'
  int maxDepth = 6, // 最大展开层级
  int maxItems = 30, // 每层最多多少元素
  int maxString = 200, // 字符串显示最大长度
  bool showTypes = true,
}) {
  dynamic obj = input;

  // 如果是类似 NetworkResponse/Response 且有 data 属性，默认先拿 data
  try {
    if (!(obj is Map || obj is List) && (obj as dynamic?)?.data != null) {
      obj = (obj as dynamic).data;
    }
  } catch (_) {}

  // 点路径（逐层时也会自动解码 JSON 字符串）
  if (path != null && path.isNotEmpty) {
    for (final k in path.split('.')) {
      obj = _decodeIfJsonString(obj);
      if (obj is Map && obj.containsKey(k)) {
        obj = obj[k];
      } else {
        debugPrint('<Key not found: $k>');
        return;
      }
    }
  }

  // 根也尝试一次解码
  obj = _decodeIfJsonString(obj);

  final seen = <int>{}; // 简单循环保护
  void walk(dynamic v, int depth, String indent, String? k) {
    final prefix = k == null ? '' : '$k: ';
    final type = showTypes ? ' <${v.runtimeType}>' : '';

    if (v == null) {
      debugPrint('$indent${prefix}null$type');
      return;
    }

    // 循环引用保护
    final id = identityHashCode(v);
    if (v is Map || v is List) {
      if (seen.contains(id)) {
        debugPrint('$indent${prefix}<cyclic>$type');
        return;
      }
      seen.add(id);
    }

    // 字符串里包着 JSON，自动解一次
    if (v is String) {
      final decoded = _tryDecodeJson(v);
      if (decoded != null) {
        walk(decoded, depth, indent, k);
        return;
      }
    }

    if (v is Map) {
      final entries = v.entries.toList();
      debugPrint('$indent${prefix}{${entries.length}}$type');
      if (depth >= maxDepth) {
        debugPrint('$indent  … <maxDepth>');
        return;
      }
      final limit = entries.length.clamp(0, maxItems);
      for (var i = 0; i < limit; i++) {
        final e = entries[i];
        walk(e.value, depth + 1, '$indent  ', e.key.toString());
      }
      if (entries.length > limit) {
        debugPrint('$indent  … and ${entries.length - limit} more');
      }
      return;
    }

    if (v is List) {
      debugPrint('$indent${prefix}[${v.length}]$type');
      if (depth >= maxDepth) {
        debugPrint('$indent  … <maxDepth>');
        return;
      }
      final limit = v.length.clamp(0, maxItems);
      for (var i = 0; i < limit; i++) {
        walk(v[i], depth + 1, '$indent  ', '[$i]');
      }
      if (v.length > limit) {
        debugPrint('$indent  … and ${v.length - limit} more');
      }
      return;
    }

    // 普通值
    var s = v.toString();
    if (s.length > maxString) s = '${s.substring(0, maxString)}…';
    debugPrint('$indent$prefix$s$type');
  }

  walk(obj, 0, '', null);
}

dynamic _decodeIfJsonString(dynamic v) {
  if (v is String) {
    final decoded = _tryDecodeJson(v);
    if (decoded != null) return decoded;
  }
  return v;
}

dynamic _tryDecodeJson(String s) {
  final trimmed = s.trimLeft();
  if (trimmed.isEmpty) return null;
  final firstChar = trimmed[0];
  if (!(firstChar == '{' || firstChar == '[')) return null;
  try {
    final d = jsonDecode(s);
    return (d is Map || d is List) ? d : null;
  } catch (_) {
    return null;
  }
}

/// 语法糖：任何对象上直接 .jobsee()
extension InspectX on Object? {
  /// 方法名前加前缀，避免与内置方法冲突
  void jobsee({
    String? path,
    int maxDepth = 6,
    int maxItems = 30,
    int maxString = 200,
    bool showTypes = true,
  }) =>
      po(
        this,
        path: path,
        maxDepth: maxDepth,
        maxItems: maxItems,
        maxString: maxString,
        showTypes: showTypes,
      );
}
