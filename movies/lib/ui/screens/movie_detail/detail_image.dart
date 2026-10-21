import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/providers.dart';
import 'package:movies/utils/utils.dart';

// Image du film : apparition en fondu + destination de l'animation Hero
class DetailImage extends ConsumerStatefulWidget {
  // Tous les détails du film
  final MovieDetails details;
  // Configuration TMDB pour construire l'adresse de l'image
  final MovieConfiguration movieConfiguration;

  const DetailImage(
      {super.key, required this.details, required this.movieConfiguration});

  @override
  ConsumerState<DetailImage> createState() => _DetailImageState();
}

class _DetailImageState extends ConsumerState<DetailImage>
    with SingleTickerProviderStateMixin {
  // Contrôleur d'animation de 2 secondes (vsync : le ticker du mixin)
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  // Animation avec une courbe "easeIn"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward(); // démarre le fondu
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tag du Hero choisi par l'écran précédent
    final heroTag = ref.watch(heroTagProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final imageUrl =
        getMovieDetailsImagePath(widget.details, widget.movieConfiguration);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        height: 200,
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: heroTag,
              // Fondu : l'opacité suit l'animation
              child: FadeTransition(
                opacity: _animation,
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        height: 200,
                        width: screenWidth,
                      )
                    : emptyWidget,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.details.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  addVerticalSpace(4),
                  // Ajout : certains films n'ont pas de date de sortie
                  if (widget.details.releaseDate != null)
                    Text(
                      yearFormat.format(widget.details.releaseDate!),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
