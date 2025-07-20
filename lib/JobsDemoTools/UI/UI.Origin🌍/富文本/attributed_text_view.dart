import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/UI/UI.Origin%F0%9F%8C%8D/%E5%AF%8C%E6%96%87%E6%9C%AC/attributed_model.dart';

/// 富文本渲染器
class AttributedTextView extends StatelessWidget {
  final List<AttributedBlock> blocks;

  const AttributedTextView({super.key, required this.blocks});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: _buildSpans(context)),
    );
  }

  List<InlineSpan> _buildSpans(BuildContext context) {
    return blocks.map((block) {
      if (block.isImage) {
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.network(block.imageUrl!, height: 20),
        );
      }

      final recognizer = block.action != null
          ? (TapGestureRecognizer()
            ..onTap = () => _handleAction(context, block.action!))
          : null;

      return TextSpan(
        text: block.text,
        style: block.style?.toTextStyle(),
        recognizer: recognizer,
      );
    }).toList();
  }

  void _handleAction(BuildContext context, AttributedAction action) {
    switch (action.type) {
      case AttributedActionType.url:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('打开链接：${action.value}')),
        );
        break;
      case AttributedActionType.mention:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('点击用户：${action.value}')),
        );
        break;
      case AttributedActionType.none:
        break;
    }
  }
}
