import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/widget/textinput/text_input_binary_message.dart';

mixin TextInputBindingMixin on WidgetsFlutterBinding{
  @override
  BinaryMessenger createBinaryMessenger() {
    return TextInputBinaryMessenger(super.createBinaryMessenger());
  }
}