import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/utils/utils.dart';

// Une ligne de la liste des favoris (données de la base locale)
class FavoriteRow extends StatelessWidget {
  final DBFavorite favorite;
  final MovieViewModel movieViewModel;
  final OnMovieTap onMovieTap;
  final OnFavoriteResultsTap onFavoritesTap;

  const FavoriteRow(
      {super.key,
      required this.favorite,
      required this.movieViewModel,
      required this.onMovieTap,
      required this.onFavoritesTap});

  @override
  Widget build(BuildContext context) {
    // null s'il n'y a pas d'image
    final imageUrl =
        movieViewModel.getImageUrl(ImageSize.small, favorite.posterPath);
    return GestureDetector(
      onTap: () => onMovieTap(favorite.movieId),
      child: SizedBox(
        height: 148,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            addHorizontalSpace(16),
            SizedBox(
              height: 140,
              width: 100,
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      height: 140,
                      width: 100,
                    )
                  : emptyWidget,
            ),
            addHorizontalSpace(16),
            // Expanded : la zone de texte prend la largeur restante
            // (corrige le débordement sur grand écran)
            Expanded(
              child: Stack(
              children: [
                // Cœur en haut à droite : le toucher retire le favori
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () => onFavoritesTap(favorite),
                    icon: favorite.favorite
                        ? const Icon(
                            Icons.favorite_outlined,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                  ),
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            // Vrai titre du film
                            favorite.title,
                            maxLines: 1,
                            minFontSize: 10,
                            style: Theme.of(context).textTheme.labelLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          addVerticalSpace(4),
                          Text(
                            // Vraie année de sortie
                            yearFormat.format(favorite.releaseDate),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          addVerticalSpace(4),
                        ],
                      ),
                    ]),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
