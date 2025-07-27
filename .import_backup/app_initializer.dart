import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/本地数据存取/sp_util.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../services/lang_service.dart';
import '../services/theme_service.dart';

class AppInitializer {
  static Future<void> init() async {
    tz.initializeTimeZones();
    await SpUtil.init();
    await ThemeService.instance.init();
    await LangService.instance.init();
  }
}
