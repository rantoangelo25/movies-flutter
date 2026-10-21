// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenreState _$GenreStateFromJson(Map<String, dynamic> json) => _GenreState(
  genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
  isSelected: json['isSelected'] as bool,
);

Map<String, dynamic> _$GenreStateToJson(_GenreState instance) =>
    <String, dynamic>{
      'genre': instance.genre.toJson(),
      'isSelected': instance.isSelected,
    };
