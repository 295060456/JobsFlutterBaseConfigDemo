import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/widget/button/custom_button.dart';
import 'package:flutter_bet/widget/status/load_state_config.dart';

import '../../constant/app_themes.dart';
import '../../generated/l10n.dart';
import '../../services/theme/theme_service.dart';
import '../custom_empty_widget.dart';
import '../custom_text.dart';
import '../network_image/custom_netework_error_view.dart';
import '../network_image/custom_network_image_placeholder.dart';

///多状态布局 默认配置
class LoadStateConfigDefault implements LoadStateConfig {
  //默认assets/images/status/ic_status_view_nodata.webp
  static const String emptyImageDefault = "assets/images/status/ic_status_view_nodata.webp";
  String emptyMessageDefault = S.current.random_text_721;

  static const String errorImageDefault = "assets/images/status/ic_status_view_error.webp";
  String errorMessageDefault = S.current.random_text_738;

  ///默认assets/images/status/ic_status_view_404.webp
  static const String netErrorImageDefault = "assets/images/status/ic_status_view_404.webp";
  String netErrorMessageDefault = S.current.random_text_739;
  String retryText = S.current.random_text_726;

  String get emptyImage => emptyImageDefault;

  String get emptyMessage => emptyMessageDefault;

  String get errorImage => errorImageDefault;

  String get errorMessage => errorMessageDefault;

  String get netErrorImage => netErrorImageDefault;

  String get netErrorMessage => netErrorMessageDefault;

  @override
  Widget? getConfigLoadingView() {
    return Container(
      height: 100,
      width: 100,
      child: CustomNetWorkImagePlaceholder(
        // color: scaffoldBackgroundColor(),
        color: AppThemes.surfaceVariant.withOpacity(0),
        placeholderType: NetWorkImagePlaceholderType.loading,
        // isDark: _isDark,
      ),
    );
  }

  @override
  Widget? getConfigEmptyView(
      String? empty, String? image, bool? showRetry, VoidCallback? errorRetry) {
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return CustomEmptyWidget(
      scale: 4,
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      // text: empty ?? emptyMessage,
      imgPath: image ?? emptyImage,
      textBuilder: (context) {
        return _buildTipAndAction(empty, emptyMessage, showRetry, errorRetry);
        return Column(
          children: [
            Text(
              empty ?? emptyMessage,
              style: ThemeService()
                  .theme
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: defaultColorScheme.onSurface),
            ),
            Visibility(
                visible: showRetry != null && showRetry,
                child: const SizedBox(height: AppValues.halfPadding)),
            Visibility(
                visible: showRetry != null && showRetry,
                child: CustomButton(
                  title: retryText,

                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.largePadding, vertical: AppValues.smallPadding),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: ThemeService().primaryColor,
                  ),
                  // backgroundColor:
                  onTap: () {
                    log('执行了，重试...');
                    if (errorRetry != null) {
                      errorRetry.call();
                    }
                  },
                ))
          ],
        );
      },
      // color: scaffoldBackgroundColor(),
      // backgroundColor: scaffoldBackgroundColor(),
    );
  }

  @override
  Widget? getConfigErrorView(
      String? error, String? image, bool? showRetry, VoidCallback? errorRetry) {
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return CustomEmptyWidget(
      scale: 4,
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      // text: empty ?? emptyMessage,
      imgPath: image ?? errorImage,
      textBuilder: (context) {
        return _buildTipAndAction(error, errorMessage, showRetry, errorRetry);
        return Column(
          children: [
            Text(
              error ?? errorMessage,
              style: ThemeService()
                  .theme
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: defaultColorScheme.onSurface),
            ),
            Visibility(
                visible: showRetry != null && showRetry,
                child: const SizedBox(height: AppValues.halfPadding)),
            Visibility(
                visible: showRetry != null && showRetry,
                child: CustomButton(
                  title: retryText,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.largePadding, vertical: AppValues.smallPadding),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: ThemeService().primaryColor,
                  ),
                  // backgroundColor:
                  onTap: () {
                    log('执行了，重试...');
                    if (errorRetry != null) {
                      errorRetry.call();
                    }
                  },
                ))
          ],
        );
      },
      // color: scaffoldBackgroundColor(),
      // backgroundColor: scaffoldBackgroundColor(),
    );
  }

  ///加载中视图
  Widget getProcessLoadingView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          // MyTextView('加载中...'.tr, marginTop: 15, fontSize: 15.5),
          CustomText(S.current.random_text_740),
        ],
      ),
    );
  }

  @override
  Widget? getConfigErrorServerView(
      String? error, String? image, bool? showRetry, VoidCallback? errorRetry) {
    return CustomEmptyWidget(
      scale: 4,
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      // text: empty ?? emptyMessage,
      imgPath: image ?? netErrorImage,
      textBuilder: (context) {
        return _buildTipAndAction(error, netErrorMessage, showRetry, errorRetry);
      },
      // color: scaffoldBackgroundColor(),
      // backgroundColor: scaffoldBackgroundColor(),
    );

    return CustomNetWorkErrorView(
      // color: scaffoldBackgroundColor(),
      color: Colors.transparent,
      onPressed: () {
        if (errorRetry != null) {
          // print("点击 重新加载...");
          errorRetry.call();
        }
      },
    );
  }

  ///创建 文本提示 和 重试按钮
  Widget _buildTipAndAction(
      String? message, String defaultMessage, bool? showRetry, VoidCallback? errorRetry) {
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return Column(
      children: [
        Text(
          message ?? defaultMessage,
          style: ThemeService()
              .theme
              .textTheme
              .labelLarge
              ?.copyWith(color: defaultColorScheme.onSurface),
        ),
        Visibility(
            visible: showRetry != null && showRetry,
            child: const SizedBox(height: AppValues.halfPadding)),
        Visibility(
            visible: showRetry != null && showRetry,
            child: CustomButton(
              title: retryText,
              textColor: Colors.white,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  //
                  fontWeight: FontWeight.w400),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.largePadding, vertical: AppValues.halfPadding),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                // color: ThemeService().primaryColor,
                color: ThemeService().colorScheme.tertiary,
                //阴影处理
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              // backgroundColor:
              onTap: () {
                log('执行了，重试...');
                if (errorRetry != null) {
                  errorRetry.call();
                }
              },
            ))
      ],
    );
  }
}
