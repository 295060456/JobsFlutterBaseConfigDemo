import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes/routes.dart';
import '../services/account_service.dart';

///url 跳转工具类
class UrlLaunchUtil {
  ///正常跳转成功，没有消息。否则会有消息；
  static Future<String> launchURL(String jumpUrl, {LaunchMode? mode}) async {
    if (jumpUrl.isEmpty) {
      return "无效链接";
    }
    if (await canLaunchUrl(Uri.parse(jumpUrl))) {
      await launchUrl(Uri.parse(jumpUrl), mode: mode ?? LaunchMode.externalApplication,webViewConfiguration: WebViewConfiguration(enableJavaScript: true));
      return "";
    } else {
      return '无法打开网址: $jumpUrl';
    }
  }

  static sendPay(String url) async {
    if (url.isEmpty) {
      return;
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw '无法打开支付路径: $url';
    }
  }

  static launchWhatsAppCall(String url) async {
    if (url.isEmpty) {
      return;
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw '无法启动 WhatsApp $url';
    }
  }


  //在线支持 跳转客服页
  static void jumpCs() {
    RouteUtil.pushToView(Routes.csHome,onBack: (dynamic){
      GlobalStateController.of().showOverlayView(isShowTopBarView: true,isShowBottomBarView: true);
    });
    GlobalStateController.of().showOverlayView(isShowTopBarView: false,isShowBottomBarView: false);
  }
}
