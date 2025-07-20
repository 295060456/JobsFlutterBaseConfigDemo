import 'package:flutter/material.dart';

/// 富文本数据结构定义
enum AttributedActionType { url, mention, none }

class AttributedAction {
  final AttributedActionType type;
  final String value;

  AttributedAction({required this.type, required this.value});
}

class AttributedStyle {
  final String? color; // Hex string like "#FF0000"
  final bool bold;
  final bool italic;
  final bool underline;
  final double fontSize;

  const AttributedStyle({
    this.color,
    this.bold = false,
    this.italic = false,
    this.underline = false,
    this.fontSize = 14,
  });

  TextStyle toTextStyle() {
    return TextStyle(
      color: color != null ? _parseColor(color!) : Colors.black,
      fontWeight: bold ? FontWeight.bold : null,
      fontStyle: italic ? FontStyle.italic : null,
      fontSize: fontSize,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceFirst('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }
}

class AttributedBlock {
  final String? text;
  final bool isImage;
  final String? imageUrl;
  final AttributedStyle? style;
  final AttributedAction? action;

  const AttributedBlock({
    this.text,
    this.style,
    this.action,
    this.isImage = false,
    this.imageUrl,
  });
}
