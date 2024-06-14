import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import '../built_value模型文件/video_item.dart';

part 'serializers.g.dart';

@SerializersFor([VideoItem, VideoList])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin()))
    .build();