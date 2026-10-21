// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoriteScreen();
    },
  );
}

/// generated route for
/// [GenreScreen]
class GenreRoute extends PageRouteInfo<void> {
  const GenreRoute({List<PageRouteInfo>? children})
    : super(GenreRoute.name, initialChildren: children);

  static const String name = 'GenreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GenreScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [MovieDetail]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required int movieId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(movieId: movieId, key: key),
         rawPathParams: {'movieId': movieId},
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MovieDetailRouteArgs>(
        orElse: () =>
            MovieDetailRouteArgs(movieId: pathParams.getInt('movieId')),
      );
      return MovieDetail(args.movieId, key: args.key);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({required this.movieId, this.key});

  final int movieId;

  final Key? key;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movieId: $movieId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailRouteArgs) return false;
    return movieId == other.movieId && key == other.key;
  }

  @override
  int get hashCode => movieId.hashCode ^ key.hashCode;
}

/// generated route for
/// [MovieListing]
class MovieListingRoute extends PageRouteInfo<MovieListingRouteArgs> {
  MovieListingRoute({
    required MovieType movieType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MovieListingRoute.name,
         args: MovieListingRouteArgs(movieType: movieType, key: key),
         initialChildren: children,
       );

  static const String name = 'MovieListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieListingRouteArgs>();
      return MovieListing(args.movieType, key: args.key);
    },
  );
}

class MovieListingRouteArgs {
  const MovieListingRouteArgs({required this.movieType, this.key});

  final MovieType movieType;

  final Key? key;

  @override
  String toString() {
    return 'MovieListingRouteArgs{movieType: $movieType, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieListingRouteArgs) return false;
    return movieType == other.movieType && key == other.key;
  }

  @override
  int get hashCode => movieType.hashCode ^ key.hashCode;
}

/// generated route for
/// [VideoPage]
class VideoPageRoute extends PageRouteInfo<VideoPageRouteArgs> {
  VideoPageRoute({
    required MovieVideo movieVideo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         VideoPageRoute.name,
         args: VideoPageRouteArgs(movieVideo: movieVideo, key: key),
         initialChildren: children,
       );

  static const String name = 'VideoPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoPageRouteArgs>();
      return VideoPage(args.movieVideo, key: args.key);
    },
  );
}

class VideoPageRouteArgs {
  const VideoPageRouteArgs({required this.movieVideo, this.key});

  final MovieVideo movieVideo;

  final Key? key;

  @override
  String toString() {
    return 'VideoPageRouteArgs{movieVideo: $movieVideo, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoPageRouteArgs) return false;
    return movieVideo == other.movieVideo && key == other.key;
  }

  @override
  int get hashCode => movieVideo.hashCode ^ key.hashCode;
}
