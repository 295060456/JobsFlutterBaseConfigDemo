import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/路由变化的监听/JobsRouteObserver.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/PopScope监听和自定义返回按钮行为/PopConfirmWrapper.dart';
import 'package:jobs_flutter_base_config/core/app_config.dart';

abstract class RouteAwareStatefulPage extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? buttonChild;

  const RouteAwareStatefulPage({
    super.key,
    required this.title,
    this.onTap,
    this.buttonChild,
  });
}

abstract class RouteAwareState<T extends RouteAwareStatefulPage>
    extends State<T> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() => debugPrint('📥 ${widget.title} pushed');
  @override
  void didPop() => debugPrint('📤 ${widget.title} popped');
  @override
  void didPopNext() => debugPrint('🔙 Return to ${widget.title}');
  @override
  void didPushNext() => debugPrint('➡️ Navigate away from ${widget.title}');

  @override
  Widget build(BuildContext context) {
    return PopConfirmWrapper(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('当前页面：${widget.title}'.tr,
                  style: normalTextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.onTap,
                child: widget.buttonChild ?? Text('点我'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
