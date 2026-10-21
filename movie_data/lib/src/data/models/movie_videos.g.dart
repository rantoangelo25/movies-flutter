// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieVideos _$MovieVideosFromJson(Map<String, dynamic> json) => _MovieVideos(
  id: (json['id'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => MovieVideo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieVideosToJson(_MovieVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => _MovieVideo(
  name: json['name'] as String,
  key: json['key'] as String,
  size: (json['size'] as num).toInt(),
  official: json['official'] as bool,
  publishedAt: DateTime.parse(json['published_at'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$MovieVideoToJson(_MovieVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'size': instance.size,
      'official': instance.official,
      'published_at': instance.publishedAt.toIso8601String(),
      'id': instance.id,
    };
