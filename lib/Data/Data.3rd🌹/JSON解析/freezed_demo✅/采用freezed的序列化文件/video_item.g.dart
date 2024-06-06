// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoItemImpl _$$VideoItemImplFromJson(Map<String, dynamic> json) =>
    _$VideoItemImpl(
      nick_name: json['nick_name'] as String?,
      head: json['head'] as String?,
      thread_id: json['thread_id'] as String?,
      first_post_id: json['first_post_id'] as String?,
      create_time: json['create_time'] as String?,
      play_count: json['play_count'] as String?,
      post_num: json['post_num'] as String?,
      agree_num: json['agree_num'] as String?,
      share_num: json['share_num'] as String?,
      has_agree: json['has_agree'] as String?,
      freq_num: json['freq_num'] as String?,
      forum_id: json['forum_id'] as String?,
      title: json['title'] as String?,
      source: json['source'] as String?,
      weight: json['weight'] as String?,
      extra: json['extra'] as String?,
      abtest_tag: json['abtest_tag'] as String?,
      thumbnail_width: json['thumbnail_width'] as String?,
      thumbnail_height: json['thumbnail_height'] as String?,
      video_md5: json['video_md5'] as String?,
      video_url: json['video_url'] as String?,
      video_duration: json['video_duration'] as String?,
      video_width: json['video_width'] as String?,
      video_height: json['video_height'] as String?,
      video_type: json['video_type'] as String?,
      thumbnail_url: json['thumbnail_url'] as String?,
      video_format: json['video_format'] as String?,
      thumbnail_picid: json['thumbnail_picid'] as String?,
      video_from: json['video_from'] as String?,
      video_log_id: json['video_log_id'] as String?,
      auditing: json['auditing'] as String?,
      origin_video_url: json['origin_video_url'] as String?,
      video_length: json['video_length'] as String?,
      video_size: json['video_size'] as String?,
    );

Map<String, dynamic> _$$VideoItemImplToJson(_$VideoItemImpl instance) =>
    <String, dynamic>{
      'nick_name': instance.nick_name,
      'head': instance.head,
      'thread_id': instance.thread_id,
      'first_post_id': instance.first_post_id,
      'create_time': instance.create_time,
      'play_count': instance.play_count,
      'post_num': instance.post_num,
      'agree_num': instance.agree_num,
      'share_num': instance.share_num,
      'has_agree': instance.has_agree,
      'freq_num': instance.freq_num,
      'forum_id': instance.forum_id,
      'title': instance.title,
      'source': instance.source,
      'weight': instance.weight,
      'extra': instance.extra,
      'abtest_tag': instance.abtest_tag,
      'thumbnail_width': instance.thumbnail_width,
      'thumbnail_height': instance.thumbnail_height,
      'video_md5': instance.video_md5,
      'video_url': instance.video_url,
      'video_duration': instance.video_duration,
      'video_width': instance.video_width,
      'video_height': instance.video_height,
      'video_type': instance.video_type,
      'thumbnail_url': instance.thumbnail_url,
      'video_format': instance.video_format,
      'thumbnail_picid': instance.thumbnail_picid,
      'video_from': instance.video_from,
      'video_log_id': instance.video_log_id,
      'auditing': instance.auditing,
      'origin_video_url': instance.origin_video_url,
      'video_length': instance.video_length,
      'video_size': instance.video_size,
    };

_$VideoListImpl _$$VideoListImplFromJson(Map<String, dynamic> json) =>
    _$VideoListImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => VideoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoListImplToJson(_$VideoListImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
