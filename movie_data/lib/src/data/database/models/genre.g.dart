// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DBMovieGenre _$DBMovieGenreFromJson(Map<String, dynamic> json) =>
    _DBMovieGenre(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DBMovieGenreToJson(_DBMovieGenre instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'name': instance.name,
    };
