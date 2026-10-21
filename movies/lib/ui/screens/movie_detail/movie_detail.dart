import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/screens/movie_detail/button_row.dart';
import 'package:movies/ui/screens/movie_detail/detail_image.dart';
import 'package:movies/ui/screens/movie_detail/genre_row.dart';
import 'package:movies/ui/screens/movie_detail/movie_overview.dart';
import 'package:movies/ui/screens/movie_detail/trailer.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/ui/widgets/horiz_cast.dart';
import 'package:movies/ui/widgets/not_ready.dart';

@RoutePage(name: 'MovieDetailRoute')
class MovieDetail extends ConsumerStatefulWidget {
  final int movieId;

  // @PathParam : récupère movieId depuis l'URL /details/:movieId (lien profond)
  const MovieDetail(@PathParam('movieId') this.movieId, {super.key});

  @override
  ConsumerState<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends ConsumerState<MovieDetail> {
  final favoriteNotifier = ValueNotifier<bool>(false);
  late MovieViewModel movieViewModel;
  MovieCredits? credits;
  MovieVideos? movieVideos;
  // Favoris enregistrés dans la base de données
  List<DBFavorite> favorites = [];
  // Ajout : le Future est mémorisé pour ne pas relancer les 3 appels
  // réseau à chaque reconstruction de la page
  Future<MovieDetails?>? detailsFuture;

  @override
  void dispose() {
    favoriteNotifier.dispose();
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
        // Ajout : on ne lit les favoris qu'une fois (le livre les relit
        // à chaque reconstruction de la page)
        if (detailsFuture == null) {
          getFavorites();
        }
        return buildScreen();
      },
    );
  }

  Widget buildScreen() {
    // Attend les détails du film avant d'afficher la page
    return FutureBuilder(
      future: detailsFuture ??= loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const NotReady();
        }
        if (snapshot.hasError) {
          logMessage('Error: ${snapshot.error.toString()}');
          return Text(snapshot.error.toString());
        }
        final movieDetails = snapshot.data;
        if (movieDetails == null) {
          return const NotReady();
        }
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
              title: Text('Back',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            body: Container(
              color: screenBackground,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomScrollView(slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          // Image, titre et année du film
                          Stack(children: [
                            DetailImage(
                              details: movieDetails,
                              movieConfiguration:
                                  movieViewModel.movieConfiguration!,
                            )
                          ]),
                          // Genres du film
                          GenreRow(genres: movieDetails.genres),
                          // Résumé
                          MovieOverview(details: movieDetails),
                          ValueListenableBuilder<bool>(
                            valueListenable: favoriteNotifier,
                            builder: (BuildContext context, bool value,
                                Widget? child) {
                              return ButtonRow(
                                favoriteSelected: favoriteNotifier.value,
                                // Enregistre ou supprime le favori
                                // dans la base de données.
                                // Correction : le livre ne supprimait
                                // pas un favori ouvert depuis l'écran
                                // Favorites ; on utilise directement
                                // l'identifiant du film.
                                onFavoriteSelected: () async {
                                  if (favoriteNotifier.value) {
                                    await movieViewModel
                                        .removeFavorite(movieDetails.id);
                                    favoriteNotifier.value = false;
                                  } else {
                                    await movieViewModel
                                        .saveFavorite(movieDetails);
                                    favoriteNotifier.value = true;
                                  }
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Text('Trailers',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                          ),
                          // Vraies bandes-annonces du film
                          Trailer(
                            movieVideos: movieVideos?.results,
                            onVideoTap: (video) {
                              context.router
                                  .push(VideoPageRoute(movieVideo: video));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 16, top: 16),
                            child: Text('Cast',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                          ),
                        ]),
                      ),
                      // Vrais acteurs du film
                      HorizontalCast(
                          movieViewModel: movieViewModel,
                          castList: credits?.cast ?? []),
                    ]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Lit les favoris et indique si ce film en fait partie
  Future getFavorites() async {
    favorites = await movieViewModel.getFavorites();
    favoriteNotifier.value = isMovieFavorite(widget.movieId);
  }

  bool isMovieFavorite(int id) {
    return favorites.firstWhereOrNull((favorite) => favorite.movieId == id) !=
        null;
  }

  // Charge les acteurs, les vidéos puis les détails du film
  Future<MovieDetails?> loadData() async {
    credits = await movieViewModel.getMovieCredits(widget.movieId);
    movieVideos = await movieViewModel.getMovieVideos(widget.movieId);
    return movieViewModel.getMovieDetails(widget.movieId);
  }
}
