import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

// Genre tel qu'il est enregistré dans la base de données
@freezed
abstract class DBMovieGenre with _$DBMovieGenre {
  const factory DBMovieGenre({
    required int id,
    required int remoteId,
    required String name,
  }) = _DBMovieGenre;

  const DBMovieGenre._();

  factory DBMovieGenre.fromJson(Map<String, dynamic> json) =>
      _$DBMovieGenreFromJson(json);
}
