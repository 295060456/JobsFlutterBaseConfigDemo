import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_item.freezed.dart';
part 'video_item.g.dart';

@freezed
class VideoItem with _$VideoItem {
  factory VideoItem({
    String? nick_name,
    String? head,
    String? thread_id,
    String? first_post_id,
    String? create_time,
    String? play_count,
    String? post_num,
    String? agree_num,
    String? share_num,
    String? has_agree,
    String? freq_num,
    String? forum_id,
    String? title,
    String? source,
    String? weight,
    String? extra,
    String? abtest_tag,
    String? thumbnail_width,
    String? thumbnail_height,
    String? video_md5,
    String? video_url,
    String? video_duration,
    String? video_width,
    String? video_height,
    String? video_type,
    String? thumbnail_url,
    String? video_format,
    String? thumbnail_picid,
    String? video_from,
    String? video_log_id,
    String? auditing,
    String? origin_video_url,
    String? video_length,
    String? video_size,
  }) = _VideoItem;

  factory VideoItem.fromJson(Map<String, dynamic> json) => _$VideoItemFromJson(json);
}

@freezed
class VideoList with _$VideoList {
  factory VideoList({
    required List<VideoItem> list,
  }) = _VideoList;

  factory VideoList.fromJson(Map<String, dynamic> json) => _$VideoListFromJson(json);
}
