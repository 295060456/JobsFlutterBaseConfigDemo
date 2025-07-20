import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/%E5%AF%8C%E6%96%87%E6%9C%AC/attributed_model.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/%E5%AF%8C%E6%96%87%E6%9C%AC/attributed_text_view.dart';

void main() => runApp(JobsMaterialRunner(
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: AttributedTextView(blocks: sampleAttributedData),
    ),
    title: '富文本统一组件示例'));

/// 示例 JSON 数据
final List<AttributedBlock> sampleAttributedData = [
  AttributedBlock(
    text: "你好，",
    style: AttributedStyle(fontSize: 16),
  ),
  AttributedBlock(
    text: "@张三",
    style: AttributedStyle(color: "#0066CC", bold: true),
    action:
        AttributedAction(type: AttributedActionType.mention, value: "user_123"),
  ),
  AttributedBlock(
    text: "，请查看",
    style: AttributedStyle(fontSize: 16),
  ),
  AttributedBlock(
    text: "《使用说明》",
    style: AttributedStyle(color: "#FF0000", underline: true),
    action: AttributedAction(
        type: AttributedActionType.url, value: "https://example.com"),
  ),
  AttributedBlock(
    text: "。",
    style: AttributedStyle(),
  ),
  AttributedBlock(
    isImage: true,
    imageUrl: "https://img.icons8.com/emoji/48/000000/fire.png",
  ),
];
