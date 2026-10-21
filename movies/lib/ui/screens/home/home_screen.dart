import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/screens/home/home_screen_image.dart';
import 'package:movies/ui/screens/home/horiz_movies.dart';
import 'package:movies/ui/screens/home/title_row.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/ui/widgets/movie_widget.dart';
import 'package:movies/ui/widgets/not_ready.dart';

@RoutePage(name: 'HomeRoute')
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late MovieViewModel movieViewModel;
  Future<List<MovieResponse?>>? movieFuture;

  @override
  Widget build(BuildContext context) {
    // Provider asynchrone : il peut être en erreur, en chargement ou prêt
    final movieViewModelAsync = ref.watch(movieViewModelProvider);
    return movieViewModelAsync.when(
      error: (e, st) => Text(e.toString()),
      loading: () => const NotReady(),
      data: (viewModel) {
        movieViewModel = viewModel;
        return buildScreen();
      },
    );
  }

  Widget buildScreen() {
    return SafeArea(
      child: Scaffold(
        // FutureBuilder : affiche NotReady tant que les films chargent
        body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if ((snapshot.connectionState != ConnectionState.active) &&
                (snapshot.connectionState != ConnectionState.done)) {
              return const NotReady();
            }
            // CustomScrollView + SliverFillRemaining (comme dans le livre)
            return CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                color: screenBackground,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 24),
                        child: Text('Now Playing', style: largeTitle),
                      ),
                    ),
                    HomeScreenImage(
                      movieViewModel: movieViewModel,
                      onMovieTap: onMovieTap,
                    ),
                    TitleRow(
                      text: 'Trending',
                      // Ouvre la liste complète de cette catégorie
                      onMoreClicked: () {
                        context.router.push(
                            MovieListingRoute(movieType: MovieType.trending));
                      },
                    ),
                    HorizontalMovies(
                      movies: movieViewModel.trendingMovies,
                      onMovieTap: onMovieTap,
                      movieType: MovieType.trending,
                    ),
                    TitleRow(
                      text: 'Popular',
                      // Ouvre la liste complète de cette catégorie
                      onMoreClicked: () {
                        context.router.push(
                            MovieListingRoute(movieType: MovieType.popular));
                      },
                    ),
                    HorizontalMovies(
                      movies: movieViewModel.popularMovies,
                      onMovieTap: onMovieTap,
                      movieType: MovieType.popular,
                    ),
                    TitleRow(
                      text: 'Top Rated',
                      // Ouvre la liste complète de cette catégorie
                      onMoreClicked: () {
                        context.router.push(
                            MovieListingRoute(movieType: MovieType.topRated));
                      },
                    ),
                    HorizontalMovies(
                      movies: movieViewModel.topRatedMovies,
                      onMovieTap: onMovieTap,
                      movieType: MovieType.topRated,
                    ),
                  ],
                ),
              ),
              ),
            ]);
          },
        ),
      ),
    );
  }

  // Ouvre la page de détails du film touché
  void onMovieTap(int movieId) {
    context.router.push(MovieDetailRoute(movieId: movieId));
  }

  // Charge la première page de chaque liste en parallèle.
  // Correction : le livre déclare cette méthode "async", ce qui crée un
  // nouveau Future à chaque affichage et fait réapparaître le chargement.
  // Sans "async", on renvoie toujours le même Future mémorisé.
  Future<List<MovieResponse?>> loadData() {
    movieFuture ??= Future.wait([
      movieViewModel.getTrendingMovies(1),
      movieViewModel.getTopRated(1),
      movieViewModel.getPopular(1),
      movieViewModel.getNowPlaying(1)
    ]);
    return movieFuture!;
  }
}
