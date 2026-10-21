import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/ui/main_screen.dart';
import 'package:movies/ui/screens/favorites/favorite_screen.dart';
import 'package:movies/ui/screens/genres/genre_screen.dart';
import 'package:movies/ui/screens/home/home_screen.dart';
import 'package:movies/ui/screens/movie_detail/movie_detail.dart';
import 'package:movies/ui/screens/movie_listing/movie_listing.dart';
import 'package:movies/ui/screens/videos/video_page.dart';
import 'package:movies/ui/widgets/movie_widget.dart';

// Fichier généré par : dart run build_runner build
part 'app_routes.gr.dart';

// Le livre (AutoRoute 8) écrit "extends _$AppRouter".
// Depuis AutoRoute 9, on étend directement RootStackRouter.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Écran principal avec ses 3 onglets
        AutoRoute(path: '/', initial: true, page: MainRoute.page, children: [
          AutoRoute(path: 'home', page: HomeRoute.page),
          AutoRoute(path: 'genre', page: GenreRoute.page),
          AutoRoute(path: 'favorites', page: FavoriteRoute.page),
        ]),
        // Page de détails : glisse depuis le bas
        CustomRoute(
          path: '/details/:movieId',
          page: MovieDetailRoute.page,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          // Le livre écrit durationInMilliseconds: 500 (ancienne syntaxe)
          duration: const Duration(milliseconds: 500),
        ),
        // Page vidéo : glisse depuis la droite
        CustomRoute(
          path: '/video',
          page: VideoPageRoute.page,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.slideRight,
          duration: const Duration(milliseconds: 500),
        ),
        // Liste complète d'une catégorie (bouton "More"), en fondu
        CustomRoute(
          path: '/listing',
          page: MovieListingRoute.page,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          duration: const Duration(milliseconds: 500),
        ),
      ];
}
