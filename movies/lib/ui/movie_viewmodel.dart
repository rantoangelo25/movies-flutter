import 'package:lumberdash/lumberdash.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/utils/utils.dart';

// Le view model passe maintenant uniquement par le dépôt (repository) :
// il ne sait plus si les données viennent du réseau ou de la base.
class MovieViewModel {
  final MovieSource _movieRepository;
  MovieConfiguration? movieConfiguration;
  List<Genre>? movieGenres;
  List<MovieResults> trendingMovies = [];
  List<MovieResults> topRatedMovies = [];
  List<MovieResults> popularMovies = [];
  List<MovieResults> nowPlayingMovies = [];

  MovieViewModel(this._movieRepository);

  Future setup() async {
    await Future.wait([setupConfiguration(), setupGenres()]);
  }

  Future setupConfiguration() async {
    final configuration = await _movieRepository.getMovieConfiguration();
    if (configuration != null) {
      movieConfiguration = configuration;
    }
  }

  Future setupGenres() async {
    movieGenres = await _movieRepository.getGenres();
  }

  String? getImageUrl(ImageSize size, String? file) {
    if (file == null || file.isEmpty || movieConfiguration == null) {
      logMessage('movieConfiguration is null for getImageUrl file: $file');
      return null;
    }
    return getSizedImageUrl(size, movieConfiguration!, file);
  }

  Future saveFavorite(MovieDetails movieDetails) async {
    await _movieRepository.saveFavorite(movieDetails);
  }

  Future<bool> removeFavorite(int id) async {
    return _movieRepository.removeFavorite(id);
  }

  Future<List<DBFavorite>> getFavorites() async {
    return _movieRepository.getFavorites();
  }

  Stream<List<DBFavorite>> streamFavorites() {
    return _movieRepository.streamFavorites();
  }

  // Ajout : on ne remplace les listes de l'accueil qu'avec la page 1.
  // Sinon, les pages suivantes chargées par l'écran "More" remplaceraient
  // les films affichés sur l'accueil.
  Future<MovieResponse?> getTrendingMovies(int page) async {
    final response = await _movieRepository.getTrending(page);
    if (response != null && page == 1) {
      trendingMovies = response.results;
    }
    return response;
  }

  Future<MovieResponse?> getPopular(int page) async {
    final response = await _movieRepository.getPopular(page);
    if (response != null && page == 1) {
      popularMovies = response.results;
    }
    return response;
  }

  Future<MovieResponse?> getTopRated(int page) async {
    final response = await _movieRepository.getTopRated(page);
    if (response != null && page == 1) {
      topRatedMovies = response.results;
    }
    return response;
  }

  Future<MovieResponse?> getNowPlaying(int page) async {
    final response = await _movieRepository.getNowPlaying(page);
    if (response != null && page == 1) {
      nowPlayingMovies = response.results;
    }
    return response;
  }

  Future<MovieDetails?> getMovieDetails(int movieId) async {
    return _movieRepository.getMovieDetails(movieId);
  }

  Future<MovieVideos?> getMovieVideos(int movieId) async {
    return _movieRepository.getMovieVideos(movieId);
  }

  Future<MovieCredits?> getMovieCredits(int movieId) async {
    return _movieRepository.getMovieCredits(movieId);
  }

  /// genres : identifiants séparés par "|"
  // Correction : le livre range aussi les résultats de recherche dans
  // nowPlayingMovies, ce qui remplacerait le carrousel de l'accueil.
  Future<MovieResponse?> searchMoviesByGenre(String genres, int page) async {
    return _movieRepository.searchMoviesByGenre(genres, page);
  }

  Future<MovieResponse?> searchMovies(String searchText, int page) async {
    return _movieRepository.searchMovies(searchText, page);
  }
}
