import 'package:jobs_flutter_base_config/DemoTools/JobsFlutterTools/高仿@iOS李明杰解析/Demo/category_model.dart';
import 'package:jobs_flutter_base_config/DemoTools/JobsFlutterTools/高仿@iOS李明杰解析/Demo/game_model.dart';
import 'package:jobs_flutter_base_config/DemoTools/JobsFlutterTools/高仿@iOS李明杰解析/MJModel.dart';

void main() {
  /// 注册所有模型
  MJModel.register<GameModel>(() => GameModel());
  MJModel.register<CategoryModel>(() => CategoryModel());

  /// 模拟 JSON 数据（含嵌套列表）
  final json = {
    "id": 1,
    "name": "热门游戏",
    "game_list": [
      {"game_id": 101, "game_name": "王者荣耀", "online": true},
      {"game_id": 102, "game_name": "和平精英", "online": false},
      {"game_id": 103, "game_name": "原神"} // 未给 online，测试默认值
    ]
  };

  /// 自动转换为模型
  final category = MJModel.from<CategoryModel>(json);

  print("分类名: ${category.categoryName}");
  print("包含游戏数量: ${category.games?.length}");
  for (var game in category.games!) {
    print("游戏: ${game.name}，是否在线: ${game.isOnline}");
  }
}
