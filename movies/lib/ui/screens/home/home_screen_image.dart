import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/providers.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/utils/utils.dart';

const delayTime = 1000 * 10;
const animationTime = 1000;

// Carrousel des films à l'affiche, avec titre, année et résumé
class HomeScreenImage extends ConsumerWidget {
  final MovieViewModel movieViewModel;
  final OnMovieTap onMovieTap;

  const HomeScreenImage({
    required this.movieViewModel,
    required this.onMovieTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return SizedBox(
      height: 374,
      child: Swiper(
        loop: false,
        autoplayDelay: delayTime,
        duration: animationTime,
        itemWidth: screenWidth,
        autoplay: true,
        itemCount: movieViewModel.nowPlayingMovies.length,
        itemBuilder: (BuildContext context, int index) {
          final currentMovie = movieViewModel.nowPlayingMovies[index];
          // Grande image de fond (backdrop) du film
          final imageUrl = movieViewModel.getImageUrl(
            ImageSize.large,
            currentMovie.backdropPath,
          );
          String uniqueHeroTag = '${currentMovie.posterPath}swiper';
          return GestureDetector(
            onTap: () {
              ref.read(heroTagProvider.notifier).state = uniqueHeroTag;
              onMovieTap(currentMovie.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: uniqueHeroTag,
                      // Pas d'image : widget vide
                      child: imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fitHeight,
                              height: 374,
                              width: screenWidth,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.broken_image,
                                color: Colors.white54,
                              ),
                            )
                          : emptyWidget,
                    ),
                  ),
                  // Titre, année et résumé par-dessus l'image
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieViewModel.nowPlayingMovies[index].title,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          addVerticalSpace(4),
                          currentMovie.releaseDate != null
                              ? Text(
                                  yearFormat.format(currentMovie.releaseDate!),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              : Container(),
                          addVerticalSpace(4),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              right: 8.0,
                            ),
                            child: AutoSizeText(
                              movieViewModel.nowPlayingMovies[index].overview,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
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
}
