import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/ui/theme/theme.dart';

// GenreState est maintenant dans lib/data/models/genre_state.dart

typedef OnGenresSelected = void Function(List<GenreState>);
typedef OnGenresExpanded = void Function(bool);

class GenreSection extends ConsumerStatefulWidget {
  final bool isExpanded;
  final List<GenreState> genreStates;
  final OnGenresExpanded onGenresExpanded;
  final OnGenresSelected onGenresSelected;

  const GenreSection({
    required this.genreStates,
    required this.isExpanded,
    required this.onGenresExpanded,
    required this.onGenresSelected,
    super.key,
  });

  @override
  ConsumerState<GenreSection> createState() => _GenreSectionState();
}

class _GenreSectionState extends ConsumerState<GenreSection> {
  @override
  Widget build(BuildContext context) {
    final genreChips = getGenreChips();
    // Sliver qui contient la section dépliable
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ExpansionPanelList(
            expandIconColor: Colors.white,
            expansionCallback: (int index, bool expanded) {
              setState(() {
                widget.onGenresExpanded(expanded);
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: widget.isExpanded,
                backgroundColor: screenBackground,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Row(
                      children: [
                        Text('Genres',
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(width: 8),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              totalSelected().toString(),
                              style: verySmallText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  // Grille de chips à la place de la Row
                  child: GridView.builder(
                    shrinkWrap: true,
                    // La grille ne défile pas elle-même
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0.0),
                    itemCount: genreChips.length,
                    // 3 colonnes de taille fixe
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            childAspectRatio: 2.2,
                            mainAxisSpacing: 0),
                    // 4. Élément à la position donnée
                    itemBuilder: (BuildContext context, int index) {
                      return genreChips[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getGenreChips() {
    return widget.genreStates.mapIndexed((index, element) {
      final genre = widget.genreStates[index].genre;
      return FilterChip(
        backgroundColor: searchBarBackground,
        selectedColor: buttonGrey,
        label: Text(genre.name,
            style: Theme.of(context).textTheme.labelSmall),
        selected: widget.genreStates[index].isSelected,
        onSelected: (selected) {
          setState(
            () {
              widget.genreStates[index] = GenreState(
                  genre: genre,
                  isSelected: !widget.genreStates[index].isSelected);
              widget.onGenresSelected(getSelectedGenres());
            },
          );
        },
      );
    }).toList();
  }

  List<GenreState> getSelectedGenres() {
    return widget.genreStates.where((e) => e.isSelected).toList();
  }

  int totalSelected() {
    return getSelectedGenres().length;
  }
}
