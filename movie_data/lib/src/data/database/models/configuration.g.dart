// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DBConfiguration _$DBConfigurationFromJson(Map<String, dynamic> json) =>
    _DBConfiguration(
      id: (json['id'] as num).toInt(),
      images: DBConfigurationImages.fromJson(
        json['images'] as Map<String, dynamic>,
      ),
      changeKeys: (json['changeKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DBConfigurationToJson(_DBConfiguration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images.toJson(),
      'changeKeys': instance.changeKeys,
    };

_DBConfigurationImages _$DBConfigurationImagesFromJson(
  Map<String, dynamic> json,
) => _DBConfigurationImages(
  baseUrl: json['baseUrl'] as String,
  secureBaseUrl: json['secureBaseUrl'] as String,
  backdropSizes: (json['backdropSizes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  logoSizes: (json['logoSizes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  posterSizes: (json['posterSizes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  profileSizes: (json['profileSizes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  stillSizes: (json['stillSizes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$DBConfigurationImagesToJson(
  _DBConfigurationImages instance,
) => <String, dynamic>{
  'baseUrl': instance.baseUrl,
  'secureBaseUrl': instance.secureBaseUrl,
  'backdropSizes': instance.backdropSizes,
  'logoSizes': instance.logoSizes,
  'posterSizes': instance.posterSizes,
  'profileSizes': instance.profileSizes,
  'stillSizes': instance.stillSizes,
};
