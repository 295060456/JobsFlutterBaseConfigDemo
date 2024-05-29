
import 'package:flutter_bet/services/event/event_service.dart';

const kStartCountDownProgressIndicatorAnimation = 'kStartCountDownProgressIndicatorAnimation';

class CustomCountDownProgressIndicatorController {

  void startAnimation() {
    EventService.instance.dispatchEvent(kStartCountDownProgressIndicatorAnimation);
  }
}
