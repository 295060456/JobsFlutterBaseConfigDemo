// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bet/constant/app_values.dart';
// import 'package:flutter_bet/extentions/ex_widget.dart';
// import 'package:flutter_bet/generated/l10n.dart';
// import 'package:flutter_bet/services/theme/theme_service.dart';
// import 'package:flutter_bet/utils/widget_util.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import 'custom_countdown_progress_indicator.dart';
// import 'custom_countdown_progress_indicator_controller.dart';
// import 'custom_snack_bar_icons.dart';
// import 'custom_timer_helper.dart';

// class CustomSnackBar {
//   /// Toast 距离顶部默认间距
//   static const int _defaultTopOffset = 50;

//   /// Toast 距离底部默认间距
//   static const int _defaultBottomOffset = 30;

//   static const int _defaultDuration = 4;

//   /// _ToastView
//   static _CustomSnackBar? _preSnackBarView;

//   static const _leftWidth = AppValues.defaultPadding * 2 * 2 + _leftIconSize;
//   static const _leftIconSize = 24.0;

//   static void dismiss() {
//     _preSnackBarView?._dismiss();
//   }

//   static void showError(
//     String text,
//     BuildContext? context,
//   ) {
//     if (context == null) return;

//     CustomSnackBar.show(text == "" ? S.current.random_text_823 : text, context,
//         title: S.current.error_title_text, preIcon: CustomSnackBarIcons.error);
//   }

//   /// 显示Toast，如不设置duration则会自动根据内容长度来计算（更友好，最长5秒）
//   static void show(
//     String text,
//     BuildContext context, {
//     String? title,
//     Duration? duration,
//     TextStyle? textStyle,
//     double? radius,
//     required Image? preIcon,
//     double? verticalOffset,
//     VoidCallback? onDismiss,
//     ThemeData? themeData,
//     Widget? subContent,
//   }) {
//     final OverlayState overlayState = Overlay.of(context);
//     final defaultTheme = themeData ?? ThemeService().theme;
//     _preSnackBarView?._dismiss();
//     _preSnackBarView = null;

//     final double finalVerticalOffset = getVerticalOffset(
//       context: context,
//       verticalOffset: verticalOffset,
//     );

//     /// 自动根据内容长度决定显示时长，更加人性化
//     final Duration finalDuration = duration ?? const Duration(seconds: _defaultDuration);
//     final OverlayEntry overlayEntry = OverlayEntry(
//       builder: (context) {
//         return ToastChild(
//           radius: radius,
//           msg: text,
//           leading: preIcon,
//           textStyle: textStyle,
//           verticalOffset: finalVerticalOffset,
//           themeData: defaultTheme,
//           title: title,
//           subContent: subContent,

//           ///点击x图标，需要执行的方法。关闭SnackBarView
//           onClose: () => _preSnackBarView?._dismiss(),
//           onFinish: () => _preSnackBarView?._dismiss(),
//         );
//       },
//     );

//     ///实例化一个SnackBarView
//     final _CustomSnackBar toastView =
//         _CustomSnackBar(overlayState: overlayState, overlayEntry: overlayEntry);
//     _preSnackBarView = toastView;

//     ///打开SnackBarView ，赋予 延迟关闭时间 和  执行回调方法
//     toastView._show(
//       duration: finalDuration,
//       onDismiss: onDismiss,
//     );
//   }

//   /// 获取默认设置的垂直间距
//   static double getVerticalOffset({
//     required BuildContext context,
//     double? verticalOffset,
//   }) {
//     final double defaultVerticalOffset = verticalOffset ?? 0;
//     final double defaultOffset;
//     final appBarHeight = WidgetUtil.getAppBarHeight(context);
//     final offset = verticalOffset ?? _defaultTopOffset + appBarHeight;
//     defaultOffset = MediaQuery.of(context).viewInsets.top + offset;
//     return defaultOffset + defaultVerticalOffset;
//   }
// }

// class _CustomSnackBar {
//   OverlayState overlayState;
//   OverlayEntry overlayEntry;
//   bool _isVisible = false;

//   _CustomSnackBar({
//     required this.overlayState,
//     required this.overlayEntry,
//   });

//   void _show({required Duration duration, VoidCallback? onDismiss}) async {
//     _isVisible = true;
//     overlayState.insert(overlayEntry);
//     //延迟执行自动关闭
//     //   Future.delayed(duration, () {
//     //   _dismiss();
//     //   onDismiss?.call();
//     // });
//     // CancelableOperation _operation = CancelableOperation.fromFuture(
//     //   Future.delayed(Duration(seconds: 5)),
//     // );
//   }

//   void _dismiss() async {
//     if (!_isVisible) {
//       return;
//     }
//     _isVisible = false;
//     overlayEntry.remove();
//   }
// }

// class ToastChild extends StatefulWidget {
//   const ToastChild({
//     Key? key,
//     required this.msg,
//     required this.verticalOffset,
//     this.radius,
//     this.leading,
//     this.textStyle,
//     this.subContent,
//     required this.themeData,
//     required this.title,
//     required this.onClose,
//     required this.onFinish,
//   }) : super(key: key);

//   final String msg;
//   final String? title;
//   final double verticalOffset;
//   final double? radius;
//   final Image? leading;
//   final TextStyle? textStyle;
//   final ThemeData themeData;
//   final Widget? subContent;
//   final Function() onClose;
//   final Function() onFinish;

//   @override
//   State<StatefulWidget> createState() => _ToastChild();
// }

// class _ToastChild extends State<ToastChild> {
//   final GlobalKey rightBoxGlobalKey = GlobalKey();
//   double _progressWidget = 0;
//   final CustomCountDownProgressIndicatorController _progressAnimationController =
//       CustomCountDownProgressIndicatorController();

//   final progressValue = 0.0.obs;
//   bool isTimeStop = false;

//   ///辅助定时器工具助手
//   late final CustomTimerHelper timeHelper;

//   @override
//   void initState() {
//     super.initState();
//     timeHelper = CustomTimerHelper(
//       durationTime: CustomSnackBar._defaultDuration,
//       onChangeValue: (value, _) {
//         progressValue.value = value / (CustomSnackBar._defaultDuration * 1000);
//       },
//       onTimeFinish: (timer) {
//         widget.onFinish();
//       },
//     );
//     timeHelper.newTimer();

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       if (mounted) {
//         final canvasBox = rightBoxGlobalKey.currentContext?.findRenderObject() as RenderBox;
//         setState(() {
//           _progressWidget = canvasBox.size.width + CustomSnackBar._leftWidth;
//           // _progressAnimationController.startAnimation();

//           timeHelper.startTimer();
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     timeHelper.closeTimer();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: widget.verticalOffset,
//         ),
//         _buildBody().paddingLeft(AppValues.defaultPadding),
//       ],
//     );
//   }

//   Widget _buildBody() {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Row(
//             children: [
//               Container(
//                 width: CustomSnackBar._leftWidth,
//                 decoration: BoxDecoration(color: widget.themeData.colorScheme.surface, boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.35),
//                       blurRadius: 5,
//                       offset: const Offset(0, 3)),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//         Row(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: CustomSnackBar._leftWidth,
//               color: widget.themeData.colorScheme.surface,
//               child: SizedBox(
//                 width: CustomSnackBar._leftIconSize,
//                 height: CustomSnackBar._leftIconSize,
//                 child: widget.leading,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 log("开发日志：点击暂停");
//                 isTimeStop = !isTimeStop;
//                 if (isTimeStop) {
//                   timeHelper.stopTimer();
//                 } else {
//                   timeHelper.startTimer();
//                 }
//               },
//               child: Container(
//                 key: rightBoxGlobalKey,
//                 padding: const EdgeInsets.only(
//                     left: AppValues.defaultPadding,
//                     bottom: AppValues.defaultPadding,
//                     top: AppValues.defaultPadding),
//                 decoration:
//                     BoxDecoration(color: widget.themeData?.colorScheme.tertiary, boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.35),
//                       blurRadius: 5,
//                       offset: const Offset(0, 3)),
//                 ]),
//                 child: Row(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         widget.title?.isNotEmpty == true
//                             ? Text(
//                                 widget.title!,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: widget.themeData.textTheme.bodyMedium
//                                     ?.copyWith(fontWeight: FontWeight.w600),
//                               )
//                             : const SizedBox.shrink(),
//                         const SizedBox(
//                           height: AppValues.smallPadding,
//                         ),
//                         widget.subContent ??
//                             Container(
//                               constraints: const BoxConstraints(minWidth: 120, maxWidth: 260),
//                               child: Text(
//                                 widget.msg,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                                 style: widget.themeData.textTheme.bodyMedium
//                                     ?.copyWith(color: widget.themeData.colorScheme.onTertiary),
//                               ),
//                             ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () => widget.onClose(),
//                       child: Container(
//                         width: AppValues.defaultPadding * 3 + 14,
//                         height: AppValues.defaultPadding * 3 + 14,
//                         alignment: Alignment.center,
//                         child: SvgPicture.asset(
//                           'assets/svg/ic_normal_close.svg',
//                           width: 12,
//                           height: 12,
//                         ),
//                       ),
//                     ).paddingLeft(AppValues.defaultPadding),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Positioned.fill(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(child: Container()),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 width: _progressWidget,
//                 height: 2,
//                 // color: Colors.redAccent,
//                 child: Obx(() {
//                   return CustomCountDownProgressIndicator(
//                     countdown: CustomSnackBar._defaultDuration,
//                     controller: _progressAnimationController,
//                     progressValue: progressValue.value,
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
