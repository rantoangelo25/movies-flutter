import 'package:dio/dio.dart';

// 1. Adresse de base de l'API TMDB
const String movieAPIUrl = 'https://api.themoviedb.org/3/';

// 2. Chemins des différentes requêtes (ajoutés à l'adresse de base)
const trendingUrl = 'trending/movie/week';
const nowPlayingUrl = 'movie/now_playing';
const topRatedUrl = 'movie/top_rated';
const popularUrl = 'movie/popular';
const movieUrl = 'movie';
const genreUrl = 'genre/movie/list';
const searchMovieUrl = 'search/movie';
const discoverMovieUrl = 'discover/movie';
const configurationUrl = 'configuration';
const videosParameter = 'videos';
const creditsParameter = 'credits';
const pageParameterName = 'page';
const movieIdParameterName = 'movie_id';
const apiKeyParameterName = 'api_key';
const queryParameterName = 'query';
const genreParameterName = 'with_genres';

class MovieAPIService {
  late final Dio dio;
  // Clé TMDB fournie par l'application (le package ne lit pas le .env)
  final String apiKey;
  // Mettre à true pour afficher tous les appels réseau dans la console
  final showDebugInfo = false;

  MovieAPIService(this.apiKey);

  // Le chargement de la clé (et la version web) est maintenant fait
  // dans providers.dart, côté application
  Future init() async {
    configureDio();
  }

  void configureDio() {
    final options = BaseOptions(
      baseUrl: movieAPIUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio(options);
    dio.interceptors.add(
      // 1. Intercepte toutes les requêtes
      InterceptorsWrapper(
        // 2. Avant chaque requête...
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 3. ... on ajoute la clé d'API aux paramètres
          final queryParameters = options.queryParameters;
          queryParameters[apiKeyParameterName] = apiKey;
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        // 4. En cas d'erreur
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
    // 5. Journal détaillé des appels (à désactiver avant de publier l'app)
    if (showDebugInfo) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }

  Future<Response> getTrending([int page = 1]) async {
    final response =
        await dio.get(trendingUrl, queryParameters: {pageParameterName: page});
    return response;
  }

  Future<Response> getNowPlaying([int page = 1]) async {
    final response = await dio
        .get(nowPlayingUrl, queryParameters: {pageParameterName: page});
    return response;
  }

  Future<Response> getTopRated([int page = 1]) async {
    final response =
        await dio.get(topRatedUrl, queryParameters: {pageParameterName: page});
    return response;
  }

  Future<Response> getPopular([int page = 1]) async {
    final response =
        await dio.get(popularUrl, queryParameters: {pageParameterName: page});
    return response;
  }

  Future<Response> getMovieDetails(int movieId) async {
    return dio.get('$movieUrl/$movieId');
  }

  Future<Response> getMovieVideos(int movieId) async {
    return dio.get('$movieUrl/$movieId/$videosParameter');
  }

  Future<Response> getMovieCredits(int movieId) async {
    return dio.get('$movieUrl/$movieId/$creditsParameter');
  }

  // API utilisées dans les chapitres suivants
  Future<Response> getGenres() async {
    final response = await dio.get(genreUrl);
    return response;
  }

  Future<Response> searchMovies(String query, [int page = 1]) async {
    return dio
        .get(searchMovieUrl, queryParameters: {queryParameterName: query});
  }

  Future<Response> searchMoviesByGenre(String genre, [int page = 1]) async {
    return dio.get(discoverMovieUrl,
        queryParameters: {genreParameterName: genre, pageParameterName: page});
  }

  Future<Response> getMovieConfiguration() async {
    return dio.get(configurationUrl);
  }
}
