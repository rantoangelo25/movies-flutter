import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/ui/widgets/cast_image.dart';
import 'package:movies/utils/utils.dart';

// Grille des acteurs (sliver, à placer dans un CustomScrollView)
class HorizontalCast extends ConsumerWidget {
  // Vrais acteurs du film
  final List<MovieCast> castList;
  final MovieViewModel movieViewModel;

  const HorizontalCast(
      {required this.movieViewModel, required this.castList, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100.0,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 100.0),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          // Ajout : acteur sans photo -> cercle gris (le livre n'affiche rien,
          // ce qui laisse un trou dans la grille)
          final imageUrl = movieViewModel.getImageUrl(
              ImageSize.small, castList[index].profilePath);
          return CastImage(
              imageUrl: imageUrl ?? '', name: castList[index].name);
        }, childCount: castList.length),
      ),
    );
  }
}
