// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Genre _$GenreFromJson(Map<String, dynamic> json) =>
    _Genre(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_Genres _$GenresFromJson(Map<String, dynamic> json) => _Genres(
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GenresToJson(_Genres instance) => <String, dynamic>{
  'genres': instance.genres.map((e) => e.toJson()).toList(),
};
