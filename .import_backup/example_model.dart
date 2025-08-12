import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/%E6%95%B0%E6%8D%AE%E5%A4%84%E7%90%86/JsonConverter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'action_cfg.dart';
part 'example_model.g.dart';

/// dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class ExampleModel {
  @MapOrStringJsonConverter<ActionCfg>(ActionCfg.fromJson)
  final ActionCfg? cfg;

  @MapOrStringListJsonConverter<ActionCfg>(ActionCfg.fromJson)
  final List<ActionCfg>? cfgList;

  @MapOrStringMapJsonConverter<ActionCfg>(ActionCfg.fromJson)
  final Map<String, ActionCfg>? cfgMap;

  ExampleModel({this.cfg, this.cfgList, this.cfgMap});

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
}
