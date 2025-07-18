import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/%E6%9C%AC%E5%9C%B0%E6%95%B0%E6%8D%AE%E5%AD%98%E5%8F%96/sp_util.dart';
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
