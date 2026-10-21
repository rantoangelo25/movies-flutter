import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/screens/genres/genre_search_row.dart';
import 'package:movies/ui/screens/genres/genre_section.dart';
import 'package:movies/ui/screens/genres/sort_picker.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/ui/widgets/not_ready.dart';
import 'package:movies/ui/widgets/sliver_divider.dart';
import 'package:movies/ui/widgets/vert_movie_list.dart';
import 'package:movies/utils/utils.dart';

// Clé utilisée pour enregistrer les genres dans SharedPreferences
const String genreStringKey = 'GenreKey';

@RoutePage(name: 'GenreRoute')
class GenreScreen extends ConsumerStatefulWidget {
  const GenreScreen({super.key});

  @override
  ConsumerState<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends ConsumerState<GenreScreen> {
  final expandedNotifier = ValueNotifier<bool>(false);
  late MovieViewModel movieViewModel;
  List<GenreState> genreStates = [];
  // Texte recherché par l'utilisateur (remplace currentSearchString)
  final searchTextNotifier = ValueNotifier<String>('');
  // Films trouvés (vrais films TMDB)
  List<MovieResults> currentMovieList = [];
  // Ne reconstruit que la liste quand les films changent
  final moviesNotifier = ValueNotifier<List<MovieResults>>([]);
  MovieResponse? currentMovieResponse;
  Sorting selectedSort = Sorting.aToz;

  @override
  void dispose() {
    expandedNotifier.dispose();
    moviesNotifier.dispose();
    searchTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Recherche reçue depuis la boîte de dialogue.
    // Correction : le livre lance la recherche pendant build(), ce qui
    // modifie des ValueNotifier en pleine construction (erreur Flutter).
    // ref.listen réagit au changement, en dehors de la construction.
    ref.listen<String>(searchTextProvider, (previous, searchText) {
      if (searchText != searchTextNotifier.value) {
        searchTextNotifier.value = searchText;
        currentMovieResponse = null;
        expandedNotifier.value = false;
        search();
      }
    });
    final movieViewModelAsync = ref.watch(movieViewModelProvider);
    return movieViewModelAsync.when(
      error: (e, st) => Text(e.toString()),
      loading: () => const NotReady(),
      data: (viewModel) {
        movieViewModel = viewModel;
        // Ne reconstruit les genres que la première fois
        if (genreStates.isEmpty) {
          buildGenreState();
        }
        return buildScreen();
      },
    );
  }

  void buildGenreState() {
    genreStates.clear();
    for (final genre in movieViewModel.movieGenres!) {
      genreStates.add(GenreState(genre: genre, isSelected: false));
    }
    // Recharge les genres enregistrés la dernière fois
    getSelectedGenres();
  }

  Widget buildScreen() {
    return Scaffold(
      backgroundColor: screenBackground,
      body: SafeArea(
        child: Container(
          color: screenBackground,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16, 16.0, 0.0, 24.0),
                            child: Text('Find a Movie',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          // Lance la recherche ; affiche le texte reçu
                          ValueListenableBuilder<String>(
                            valueListenable: searchTextNotifier,
                            builder: (BuildContext context, String value,
                                Widget? child) {
                              return GenreSearchRow(searchTextNotifier.value,
                                  (searchString) {
                                searchTextNotifier.value = searchString;
                                currentMovieResponse = null;
                                // Ferme le clavier et la section des genres
                                FocusScope.of(context).unfocus();
                                expandedNotifier.value = false;
                                search();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: expandedNotifier,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return GenreSection(
                          genreStates: genreStates,
                          isExpanded: value,
                          onGenresExpanded: (expanded) {
                            expandedNotifier.value = expanded;
                          },
                          // Correction : le livre écrit "genreStates = genres",
                          // ce qui ne garde que les genres cochés et fait
                          // disparaître les autres de la grille. La liste est
                          // déjà mise à jour par GenreSection : on enregistre.
                          onGenresSelected: (genres) {
                            saveSelectedGenres();
                            currentMovieResponse = null;
                          },
                        );
                      },
                    ),
                    const SliverDivider(),
                    // Trie à nouveau la liste
                    SortPicker(
                        useSliver: true,
                        onSortSelected: (sorting) {
                          selectedSort = sorting;
                          sortMovies();
                        }),
                    // Liste des films trouvés
                    ValueListenableBuilder<List<MovieResults>>(
                      valueListenable: moviesNotifier,
                      builder: (BuildContext context, List<MovieResults> value,
                          Widget? child) {
                        return VerticalMovieList(
                          movies: value,
                          movieViewModel: movieViewModel,
                          onMovieTap: (movieId) {
                            context.router
                                .push(MovieDetailRoute(movieId: movieId));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Genres actuellement cochés
  // Correction : le livre utilise la liste de TOUS les genres dans la
  // recherche, si bien que le filtre par genre ne filtre rien.
  List<GenreState> get selectedGenres =>
      genreStates.where((state) => state.isSelected).toList();

  Future<List<MovieResults>?> search() async {
    // 1. Rien à chercher
    if (searchTextNotifier.value.isEmpty && selectedGenres.isEmpty) {
      moviesNotifier.value = <MovieResults>[];
      return <MovieResults>[];
    }
    // 2. Page suivante si on a déjà des résultats
    final pageNumber = (currentMovieResponse?.page == null)
        ? 1
        : (currentMovieResponse!.page + 1);
    // 3. Recherche par titre
    if (searchTextNotifier.value.isNotEmpty) {
      currentMovieResponse =
          await movieViewModel.searchMovies(searchTextNotifier.value, pageNumber);
      currentMovieList = currentMovieResponse?.results ?? [];
    }
    // 4. Sans texte : recherche par genre
    if (searchTextNotifier.value.isEmpty && selectedGenres.isNotEmpty) {
      final buffer = getGenreString();
      currentMovieResponse = await movieViewModel.searchMoviesByGenre(
          buffer.toString(), pageNumber);
      currentMovieList = currentMovieResponse?.results ?? [];
      // 5. Avec texte et genres : on garde les films de ces genres
    } else if (selectedGenres.isNotEmpty && currentMovieList.isNotEmpty) {
      currentMovieList = currentMovieList.where((movie) {
        for (final selectedGenre in selectedGenres) {
          if (movie.genreIds.contains(selectedGenre.genre.id)) {
            return true;
          }
        }
        return false;
      }).toList();
    }
    // 6. Tri, puis mise à jour de la liste affichée
    sortMovies();
    // Ajout : met aussi à jour la liste quand elle est vide
    moviesNotifier.value = currentMovieList;
    return currentMovieList;
  }

  // Identifiants des genres cochés séparés par "|" (format de l'API)
  StringBuffer getGenreString() {
    final buffer = StringBuffer();
    for (final state in selectedGenres) {
      if (buffer.isNotEmpty) {
        buffer.write('|');
      }
      buffer.write(state.genre.id);
    }
    return buffer;
  }

  void sortMovies() {
    if (currentMovieList.isEmpty) {
      return;
    }
    currentMovieList = currentMovieList.sorted((a, b) {
      switch (selectedSort) {
        case Sorting.aToz:
          return a.originalTitle.compareTo(b.originalTitle);
        case Sorting.zToa:
          return b.originalTitle.compareTo(a.originalTitle);
        case Sorting.rating:
          return b.popularity.compareTo(a.popularity);
        case Sorting.year:
          if (a.releaseDate != null && b.releaseDate != null) {
            return a.releaseDate!.compareTo(b.releaseDate!);
          }
      }
      return 0;
    });
    moviesNotifier.value = currentMovieList;
  }

  // Enregistre les noms des genres cochés, séparés par des virgules.
  // Correction : le livre enregistre TOUS les genres, cochés ou non.
  void saveSelectedGenres() async {
    final prefs = await ref.read(prefsProvider.future);
    final genreNameList =
        selectedGenres.map((state) => state.genre.name).toList();
    // Ajout du chapitre 17 : setString renvoie un Future, on l'attend
    await prefs.setString(genreStringKey, genreNameList.join(','));
  }

  void getSelectedGenres() async {
    // 1. Instance de Prefs
    final prefs = await ref.read(prefsProvider.future);
    // 2. Liste des noms de genres enregistrés
    // getString renvoie maintenant un Future : on l'attend avant split
    final genreNameList = (await prefs.getString(genreStringKey))?.split(',');
    if (genreNameList?.isNotEmpty == true) {
      // 3. Pour chaque genre enregistré...
      for (final genreName in genreNameList!) {
        // 4. ... on cherche l'état correspondant
        var genreState = genreStates
            .firstWhereOrNull((genre) => genre.genre.name == genreName);
        if (genreState != null) {
          // 5. ... et on le coche (copyWith généré par freezed)
          final index = genreStates.indexOf(genreState);
          genreState = genreState.copyWith(isSelected: true);
          genreStates[index] = genreState;
        }
      }
    }
    // Ajout : rafraîchit l'écran pour afficher les genres rechargés
    if (mounted) {
      setState(() {});
    }
  }
}
