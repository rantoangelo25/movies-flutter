import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/providers.dart';
import 'package:movies/ui/menus.dart';
import 'package:movies/utils/utils.dart';

// Boîte de dialogue de recherche (ouverte par le menu Search)
class SearchDialog extends ConsumerStatefulWidget {
  const SearchDialog({super.key});

  @override
  ConsumerState<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends ConsumerState<SearchDialog> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  // Envoie la recherche puis ferme la boîte de dialogue.
  // Le livre utilise context.router.maybePop() ; Navigator.pop ferme
  // directement la boîte de dialogue, qui n'est pas une route AutoRoute.
  void sendSearch(String text) {
    ref.read(eventBusProvider).fire(SearchMovieEvent(text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final width = query.size.width * 0.7;
    const height = 300.0;
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Movies',
                    ),
                    autofocus: true,
                    style: const TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.done,
                    onSubmitted: sendSearch,
                    controller: searchTextController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel')),
                    addHorizontalSpace(8),
                    ElevatedButton(
                        onPressed: () => sendSearch(searchTextController.text),
                        child: const Text('Search'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
