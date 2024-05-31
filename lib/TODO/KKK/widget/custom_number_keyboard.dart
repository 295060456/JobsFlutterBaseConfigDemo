import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_themes.dart';
import '../constant/app_values.dart';

class CustomNumberKeyboard extends StatelessWidget {
  CustomNumberKeyboard({super.key, required this.onKeyPressed, this.margin});

  final EdgeInsetsGeometry? margin;
  final Function(String) onKeyPressed;

  double keyWidth = (Get.width - 10.sp) / 4;

  Widget _buildKey(String value) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onKeyPressed(value);
      },
      child: Container(
        width: keyWidth,
        height: (value == 'OK' ? keyWidth / 91.25 * 42.5 * 3 + 4.sp : keyWidth / 91.25 * 42.5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          // border: Border.all(color: Colors.grey),
          color: AppThemes.surfaceVariant,
        ),
        child: value == 'delete'
            ? const CustomAssetIcon(
          name: 'assets/images/sport/ic_delate.webp',
          size: 18,
        )
            : Text(
          value,
          style: const TextStyle(fontSize: 24, color: AppThemes.keyboardTextColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (Get.width - 4) / 371 * 176 + 8.sp,
      margin: margin,
      color: Colors.transparent,
      child: Row(
        children: [
          Column(
            children: [
              Container(height: 2.sp),
              _buildKey('7'),
              Container(height: 2.sp),
              _buildKey('4'),
              Container(height: 2.sp),
              _buildKey('1'),
              Container(height: 2.sp),
              _buildKey('00'),
            ],
          ),
          Container(width: 2.sp),
          Column(
            children: [
              Container(height: 2.sp),
              _buildKey('8'),
              Container(height: 2.sp),
              _buildKey('5'),
              Container(height: 2.sp),
              _buildKey('2'),
              Container(height: 2.sp),
              _buildKey('0'),
            ],
          ),
          Container(width: 2.sp),
          Column(
            children: [
              Container(height: 2.sp),
              _buildKey('9'),
              Container(height: 2.sp),
              _buildKey('6'),
              Container(height: 2.sp),
              _buildKey('3'),
              Container(height: 2.sp),
              _buildKey('.'),
            ],
          ),
          Container(width: 2.sp),
          Column(
            children: [
              Container(height: 2.sp),
              _buildKey('delete'),
              Container(height: 2.sp),
              _buildKey('OK'),
            ],
          ),
        ],
      ),
    );
  }
}
