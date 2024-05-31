import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'custom_text.dart';

class CustomKeyBoardActionsWidget extends StatelessWidget {
  final List<FocusNode> focusNodes;
  final Widget child;
  const CustomKeyBoardActionsWidget(
      {super.key, required this.focusNodes, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return KeyboardActions(
      config: buildKeyboardConfig(context, focusNodes),
      child: child,
    );
  }

  /// 三方键盘配置
  static KeyboardActionsConfig buildKeyboardConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: ThemeService().colorScheme.surfaceVariant,
      nextFocus: true,
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          Container(color: Colors.transparent, width: 100),
                          Positioned(
                              right: AppValues.defaultPadding,
                              child: CustomText(S.current.done_text)),
                        ],
                      ),
                    );
                  },
                ],
              )),
    );
  }
}
