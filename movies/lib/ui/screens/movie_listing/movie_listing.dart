import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/ui/widgets/movie_row.dart';
import 'package:movies/ui/widgets/movie_widget.dart';
import 'package:movies/ui/widgets/not_ready.dart';

// TMDB n'accepte pas de numéro de page supérieur à 500
const maxTmdbPage = 500;

// Liste complète d'une catégorie de films, chargée page par page
// au fur et à mesure du défilement (défilement infini).
@RoutePage(name: 'MovieListingRoute')
class MovieListing extends ConsumerStatefulWidget {
  final MovieType movieType;

  const MovieListing(this.movieType, {super.key});

  @override
  ConsumerState<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends ConsumerState<MovieListing> {
  late MovieViewModel movieViewModel;
  int totalPagesAvailable = 0;

  // Le livre utilise l'API de la version 4 du package
  // (addPageRequestListener, appendPage...), supprimée dans la version 5.
  // Version 5 : le contrôleur reçoit deux fonctions.
  late final PagingController<int, MovieResults> _pagingController =
      PagingController<int, MovieResults>(
    // Numéro de la page suivante, ou null s'il n'y en a plus
    getNextPageKey: (state) {
      if (state.lastPageIsEmpty) {
        return null;
      }
      final lastPage = state.keys?.last ?? 0;
      if (totalPagesAvailable > 0 &&
          lastPage >= totalPagesAvailable.clamp(1, maxTmdbPage)) {
        return null;
      }
      // Pages numérotées 1, 2, 3...
      return state.nextIntPageKey;
    },
    // Charge une page de films
    fetchPage: (pageKey) => loadMovies(pageKey),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

  // Correction : le livre entoure l'écran d'un FutureBuilder qui recharge
  // une page à chaque reconstruction, en plus du contrôleur. Ici, seul le
  // contrôleur demande les pages.
  Widget buildScreen() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: screenBackground,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              context.router.maybePopTop();
            },
          ),
          centerTitle: false,
          title:
              Text('Back', style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: Container(
          color: screenBackground,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16.0, 0.0, 24.0),
                child: Text(getTitle(),
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const Divider(),
              Expanded(
                // PagingListener relie le contrôleur à la liste
                child: PagingListener(
                  controller: _pagingController,
                  builder: (context, state, fetchNextPage) =>
                      // Liste qui demande la page suivante en bas de l'écran
                      PagedListView<int, MovieResults>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate<MovieResults>(
                      // Chaque film est affiché avec MovieRow
                      itemBuilder: (context, item, index) => MovieRow(
                        movie: item,
                        movieViewModel: movieViewModel,
                        onMovieTap: (movie) {
                          onMovieTap(movie.id);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle() {
    switch (widget.movieType) {
      case MovieType.trending:
        return 'Trending';
      case MovieType.popular:
        return 'Popular';
      case MovieType.topRated:
        return 'Top Rated';
      case MovieType.nowPlaying:
        return 'Now Playing';
    }
  }

  void onMovieTap(int movieId) {
    context.router.push(MovieDetailRoute(movieId: movieId));
  }

  // 1. Appelle la bonne méthode du view model selon la catégorie
  Future<List<MovieResults>> loadMovies(int page) async {
    MovieResponse? currentMovieResponse;
    switch (widget.movieType) {
      case MovieType.trending:
        currentMovieResponse = await movieViewModel.getTrendingMovies(page);
      case MovieType.popular:
        currentMovieResponse = await movieViewModel.getPopular(page);
      case MovieType.topRated:
        currentMovieResponse = await movieViewModel.getTopRated(page);
      case MovieType.nowPlaying:
        currentMovieResponse = await movieViewModel.getNowPlaying(page);
    }
    if (currentMovieResponse == null) {
      // Erreur : le package affiche un message avec un bouton pour réessayer
      throw Exception('Impossible de charger la page $page');
    }
    // 2. Nombre total de pages disponibles
    totalPagesAvailable = currentMovieResponse.totalPages;
    return currentMovieResponse.results;
  }
}
