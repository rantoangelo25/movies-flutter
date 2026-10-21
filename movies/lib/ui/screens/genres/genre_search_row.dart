import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/ui/theme/theme.dart';

// Fonction appelée avec le texte recherché
typedef OnSearch = void Function(String searchString);

class GenreSearchRow extends ConsumerStatefulWidget {
  // Texte à afficher (par exemple venant de la boîte de recherche)
  final String searchText;
  final OnSearch onSearch;

  const GenreSearchRow(this.searchText, this.onSearch, {super.key});

  @override
  ConsumerState<GenreSearchRow> createState() => _GenreSearchRowState();
}

class _GenreSearchRowState extends ConsumerState<GenreSearchRow> {
  late TextEditingController movieTextController =
      TextEditingController(text: widget.searchText);
  final FocusNode textFocusNode = FocusNode();

  // Le livre recopie le texte au début de build(), ce qui effacerait ce que
  // l'utilisateur est en train de taper à chaque reconstruction. On ne le
  // recopie que lorsque le texte reçu change vraiment.
  @override
  void didUpdateWidget(covariant GenreSearchRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchText != oldWidget.searchText) {
      movieTextController.text = widget.searchText;
    }
  }

  @override
  void dispose() {
    movieTextController.dispose();
    textFocusNode.dispose(); // ajout : libérer aussi le FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              focusNode: textFocusNode,
              keyboardType: TextInputType.text,
              enableSuggestions: false,
              autofocus: false,
              // 1. Touche "Entrée" du clavier
              onSubmitted: (value) {
                widget.onSearch(value);
              },
              // 2. Contrôleur du texte
              controller: movieTextController,
              autocorrect: false,
              // 3. Rectangle arrondi autour du champ
              decoration: InputDecoration(
                filled: true,
                focusColor: searchBarBackground,
                focusedBorder: null,
                enabledBorder: null,
                fillColor: searchBarBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'movie name, genre',
                hintStyle: body1Regular.copyWith(color: posterBorder),
                // 4. Icône pour effacer le texte
                suffixIcon: IconButton(
                  onPressed: () {
                    movieTextController.clear();
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
                // 5. Icône de recherche
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    widget.onSearch(movieTextController.text);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
