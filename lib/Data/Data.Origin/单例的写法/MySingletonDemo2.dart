import '../../../TODO/KKK/utils/sp_util.dart';

// 用于管理Flutter应用中的本地存储
// 使用SharedPreferences来存储和检索数据
Future<void> main() async{
  ///SPUtil必须启动时预初始化
  await SPUtil.perInit();
}

