import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:movie_data/src/data/models/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

// Convertit "2024-07-24" en DateTime (null si la date est vide)
DateTime? _parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  return DateFormat('yyyy-MM-dd').parse(dateString);
}

// Détails complets d'un film.
// Ajout : certains champs sont nullables (?) car TMDB les renvoie parfois
// vides (film sans image de fond, sans site, sans date...). Avec le code
// du livre, la page de ces films resterait bloquée sur le chargement.
@freezed
abstract class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'budget') required int budget,
    @JsonKey(name: 'genres') required List<Genre> genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'origin_country') required List<String> originCountry,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date', fromJson: _parseDate) DateTime? releaseDate,
    @JsonKey(name: 'revenue') required int revenue,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'video') required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
