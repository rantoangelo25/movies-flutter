import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'movie_results.freezed.dart';
part 'movie_results.g.dart';

// Convertit "2024-07-24" en DateTime (null si la date est vide)
DateTime? _parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  return DateFormat('yyyy-MM-dd').parse(dateString);
}

// 1. Classe générée par freezed
// Le livre écrit "class MovieResults" : depuis freezed 3, la classe
// doit être déclarée "abstract".
@freezed
// 2. Mixin généré _$MovieResults
abstract class MovieResults with _$MovieResults {
  // 3. Constructeur "factory"
  const factory MovieResults({
    // 4. @JsonKey : nom du champ dans le JSON
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    // 5. Champ non nullable : required
    required int id,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') String? mediaType,
    required bool adult,
    required String title,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required double popularity,
    // 6. Conversion de la date avec _parseDate
    @JsonKey(name: 'release_date', fromJson: _parseDate) DateTime? releaseDate,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    // 7. Se termine par le nom de la classe avec un underscore
  }) = _MovieResults;

  // 8. fromJson généré par freezed / json_serializable
  factory MovieResults.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsFromJson(json);
}
