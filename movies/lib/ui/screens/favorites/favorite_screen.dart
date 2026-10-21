import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/screens/genres/sort_picker.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/ui/widgets/account_button.dart';
import 'package:movies/ui/widgets/not_ready.dart';
import 'package:movies/ui/widgets/vert_favorite_list.dart';
import 'package:movies/utils/utils.dart';

@RoutePage(name: 'FavoriteRoute')
class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  late MovieViewModel movieViewModel;
  List<DBFavorite> currentFavorites = [];
  Sorting selectedSort = Sorting.aToz;
  final valueNotifier = ValueNotifier<List<DBFavorite>>([]);
  // Ajout : le stream est créé une seule fois. Le stream drift se met
  // à jour tout seul quand la table des favoris change.
  Stream<List<DBFavorite>>? favoriteStream;

  @override
  void dispose() {
    valueNotifier.dispose();
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

  Widget buildScreen() {
    return SafeArea(
      child: StreamBuilder<List<DBFavorite>>(
        // 1. Stream des favoris
        stream: getFavoriteStream(),
        builder: (context, snapshot) {
          if ((snapshot.connectionState != ConnectionState.active) &&
              (snapshot.connectionState != ConnectionState.done)) {
            return const NotReady();
          }
          return Scaffold(
            body: Container(
              color: screenBackground,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        // 2. Titre
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              // Titre + bouton de compte à droite
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 16.0, 16.0, 24.0),
                                child: Row(
                                  children: [
                                    Text('My Favorites',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    const Spacer(),
                                    const AccountButton(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 3. Tri
                        SortPicker(
                            useSliver: true,
                            onSortSelected: (sorting) {
                              selectedSort = sorting;
                              sortMovies();
                            }),
                        // 4. Liste des favoris
                        VerticalFavoriteList(
                          favorites: snapshot.requireData,
                          movieViewModel: movieViewModel,
                          onMovieTap: (movieId) {
                            context.router
                                .push(MovieDetailRoute(movieId: movieId));
                          },
                          onFavoritesTap: (DBFavorite favorite) {
                            // 5. Supprime le favori de la base de données
                            removeFavorite(favorite);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Stream<List<DBFavorite>> getFavoriteStream() {
    favoriteStream ??= movieViewModel.streamFavorites();
    return favoriteStream!;
  }

  // Trie par titre, popularité ou date de sortie
  void sortMovies() {
    if (currentFavorites.isEmpty) {
      return;
    }
    currentFavorites = currentFavorites.sorted((a, b) {
      switch (selectedSort) {
        case Sorting.aToz:
          return a.title.compareTo(b.title);
        case Sorting.zToa:
          return b.title.compareTo(a.title);
        case Sorting.rating:
          return b.popularity.compareTo(a.popularity);
        case Sorting.year:
          return a.releaseDate.compareTo(b.releaseDate);
      }
    });
    valueNotifier.value = currentFavorites;
  }

  Future removeFavorite(DBFavorite favorite) async {
    await movieViewModel.removeFavorite(favorite.id);
    setState(() {});
  }
}
