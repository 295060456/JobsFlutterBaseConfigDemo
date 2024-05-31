import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/widget/textinput/text_input_focus_node.dart';

class TextInputBinaryMessenger extends BinaryMessenger{
  TextInputBinaryMessenger(this.origin);
  final BinaryMessenger origin;

  @override
  Future<void> handlePlatformMessage(String channel, ByteData? data, PlatformMessageResponseCallback? callback) {
    return origin.handlePlatformMessage(channel, data, callback);
  }

  @override
  Future<ByteData?>? send(String channel, ByteData? message) {
    if (channel == SystemChannels.textInput.name) {
      final MethodCall methodCall =
      SystemChannels.textInput.codec.decodeMethodCall(message);
      switch (methodCall.method) {
        case 'TextInput.show':
          final FocusNode? focus = FocusManager.instance.primaryFocus;
          if (focus != null &&
              focus is TextInputFocusNode &&
              focus.ignoreSystemKeyboardShow) {
            return Future.value(SystemChannels.textInput.codec.encodeSuccessEnvelope(null));
          }
          break;
        default:
      }
    }
    return origin.send(channel, message);
  }

  @override
  void setMessageHandler(String channel, MessageHandler? handler) {
    origin.setMessageHandler(channel, handler);
  }

}