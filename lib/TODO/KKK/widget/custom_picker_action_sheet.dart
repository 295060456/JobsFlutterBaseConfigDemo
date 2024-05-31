import 'package:flutter_bet/generated/l10n.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/utils/permission_utils.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'button/custom_button.dart';
import 'dialog/custom_dialog.dart';
import 'dialog/custom_safe_dialog.dart';

class CustomPickerActionSheet extends StatelessWidget {
  const CustomPickerActionSheet({
    Key? key,
    required this.requestType,
    required this.maxAssets,
    required this.handleResult,
    this.colorScheme,
    required this.context,
  }) : super(key: key);

  final RequestType requestType;
  final int maxAssets;
  final Function(List<AssetEntity>) handleResult;
  final ColorScheme? colorScheme;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: defaultColorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        child: _buildContent(context, defaultColorScheme),
      ),
    );
  }

  _buildContent(BuildContext context, ColorScheme colorScheme) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          onTap: () {
            openCamera();
          },
          alignment: Alignment.center,
          constraints: _buildBoxConstraints(),
          child: Text(
            S.current.random_text_722,
          ),
        ),
        // const Divider(
        //   height: 0.5,
        //   indent: 0,
        //   endIndent: 0,
        // ),
        CustomButton(
          onTap: () {
            openPicker();
          },
          constraints: _buildBoxConstraints(),
          alignment: Alignment.center,
          child: Text(
            S.current.random_text_723,
          ),
        ),
        SizedBox(
          height: AppValues.halfPadding,
          child: Container(
            color: colorScheme.surface,
          ),
        ),
        CustomButton(
          onTap: () {
            RouteUtil.popView();
          },
          alignment: Alignment.center,
          constraints: _buildBoxConstraints(),
          child: Text(
            S.current.wallet_cancel,
          ),
        ),
        Container(
          height: bottomPadding,
        ),
      ],
    );
  }

  BoxConstraints _buildBoxConstraints() {
    return const BoxConstraints(
      minHeight: 54,
      minWidth: double.infinity,
    );
  }

  Future<void> openPicker() async {
    bool result = false;
    Permission permission;
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if ((androidInfo.version.sdkInt ?? 0) <= 32) {
        permission = Permission.storage;
      } else {
        permission = Permission.photos;
      }
    } else {
      permission = Permission.photos;
    }

    await PermissionUtils.checkPermission(
        permission: permission,
        onSuccess: () {
          result = true;
        },
        goSetting: () async {
          bool? confirm = await showCustomDialog(
              title: S.current.random_text_347,
              confirm: S.current.random_text_529,
              content: S.current.random_text_530,
              context: context);
          if (confirm == true) {
            await openAppSettings();
          }
        });
    if (!result) return;

    final List<AssetEntity>? assets = await AssetPicker.pickAssets(context,
        pickerConfig: AssetPickerConfig(
          maxAssets: maxAssets,
          requestType: requestType,
        ));
    if (assets != null && assets!.isNotEmpty) {
      handleResult(assets);
    }
    RouteUtil.popView();
  }

  Future<void> openCamera() async {
    final AssetEntity? result = await CameraPicker.pickFromCamera(
      context,
      pickerConfig: const CameraPickerConfig(enableRecording: true),
    );
    if (result != null) {
      handleResult([result!]);
    }
    RouteUtil.popView();
  }
}

Future<List<AssetEntity>?> showCustomPickerActionSheet<T>({
  required BuildContext context,
  ColorScheme? colorScheme,
  RequestType? requestType,
  int? maxAssets,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
}) async {
  List<AssetEntity>? result;
  await CustomSafeDialog.show<T>(
      context: context,
      tag: 'CustomPickerActionSheet',
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  RouteUtil.popView();
                },
              )),
              CustomPickerActionSheet(
                requestType: requestType ?? RequestType.common,
                maxAssets: maxAssets ?? 1,
                handleResult: (assets) {
                  result = assets;
                },
                context: context,
              ),
            ],
          ),
        );
      });
  return result;
}
