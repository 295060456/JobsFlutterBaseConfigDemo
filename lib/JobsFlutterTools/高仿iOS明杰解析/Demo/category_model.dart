import 'package:jobs_flutter_base_config/JobsFlutterTools/%E9%AB%98%E4%BB%BFiOS%E6%98%8E%E6%9D%B0%E8%A7%A3%E6%9E%90/MJModel.dart';
import 'game_model.dart';

class CategoryModel extends MJModel<CategoryModel> {
  int? categoryId;
  String? categoryName;
  List<GameModel>? games;

  CategoryModel({this.categoryId, this.categoryName, this.games});

  @override
  Map<String, String> keyMapping() =>
      {'categoryId': 'id', 'categoryName': 'name', 'games': 'game_list'};

  @override
  Map<String, dynamic> toJson() => {
        'id': categoryId,
        'name': categoryName,
        'game_list': games?.map((e) => e.toJson()).toList(),
      };

  @override
  List<String> getFieldNames() => ['categoryId', 'categoryName', 'games'];

  @override
  Type? getFieldType(String field) {
    switch (field) {
      case 'categoryId':
        return int;
      case 'categoryName':
        return String;
      case 'games':
        return GameModel;
    }
    return null;
  }

  @override
  void setField(String field, dynamic value) {
    switch (field) {
      case 'categoryId':
        categoryId = value;
        break;
      case 'categoryName':
        categoryName = value;
        break;
      case 'games':
        games = value?.cast<GameModel>();
        break;
    }
  }
}
