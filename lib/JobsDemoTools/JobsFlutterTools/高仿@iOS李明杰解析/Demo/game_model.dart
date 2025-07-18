import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/%E9%AB%98%E4%BB%BF@iOS%E6%9D%8E%E6%98%8E%E6%9D%B0%E8%A7%A3%E6%9E%90/MJModel.dart';

class GameModel extends MJModel<GameModel> {
  int? id;
  String? name;
  bool? isOnline;

  GameModel({this.id, this.name, this.isOnline});

  @override
  Map<String, String> keyMapping() => {
        'id': 'game_id',
        'name': 'game_name',
        'isOnline': 'online',
      };

  @override
  Map<String, dynamic> defaultValues() => {
        'isOnline': false,
      };

  @override
  Map<String, dynamic> toJson() => {
        'game_id': id,
        'game_name': name,
        'online': isOnline,
      };

  @override
  List<String> getFieldNames() => ['id', 'name', 'isOnline'];

  @override
  Type? getFieldType(String field) {
    switch (field) {
      case 'id':
        return int;
      case 'name':
        return String;
      case 'isOnline':
        return bool;
    }
    return null;
  }

  @override
  void setField(String field, dynamic value) {
    switch (field) {
      case 'id':
        id = value;
        break;
      case 'name':
        name = value;
        break;
      case 'isOnline':
        isOnline = value;
        break;
    }
  }
}
