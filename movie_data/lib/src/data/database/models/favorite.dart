import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

// Film favori enregistré dans la base de données : on garde toutes les
// informations utiles pour ne pas refaire d'appel réseau
@freezed
abstract class DBFavorite with _$DBFavorite {
  const factory DBFavorite({
    required int id,
    required int movieId,
    required String backdropPath,
    required String posterPath,
    required bool favorite,
    required double popularity,
    required DateTime releaseDate,
    required String title,
    required String overview,
  }) = _DBFavorite;

  const DBFavorite._();

  factory DBFavorite.fromJson(Map<String, dynamic> json) =>
      _$DBFavoriteFromJson(json);
}
