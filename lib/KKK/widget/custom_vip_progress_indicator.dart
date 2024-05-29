import 'package:flutter/cupertino.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/widget/progress/custom_linear_progress_indicator.dart';

class CustomVipProgressIndicator extends StatelessWidget {
  final double? value;
  final double? minHeight;
  final double borderRadius;

  const CustomVipProgressIndicator(
      {super.key, this.value, this.minHeight = 16, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CustomLinearProgressIndicator(
        value: value,
        minHeight: minHeight,
      ),
    );
  }
}
