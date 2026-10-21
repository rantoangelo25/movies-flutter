import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/providers.dart';
import 'package:movies/utils/utils.dart';

// 1. Les différentes catégories de films
// (le livre écrit MovieType.Trending avec une majuscule ; les valeurs
// étant déclarées en minuscules, on écrit MovieType.trending)
enum MovieType { trending, popular, topRated, nowPlaying }

// Affiche d'un film avec animation Hero et effet de pulsation
class MovieWidget extends ConsumerStatefulWidget {
  // 2. Identifiant, adresse, fonction de toucher et catégorie
  final int movieId;
  final String movieUrl;
  final OnMovieTap onMovieTap;
  final MovieType movieType;

  const MovieWidget(
      {required this.movieId,
      required this.movieUrl,
      required this.onMovieTap,
      required this.movieType,
      super.key});

  @override
  ConsumerState<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends ConsumerState<MovieWidget>
    with SingleTickerProviderStateMixin {
  bool animateImage = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late String uniqueHeroTag;

  @override
  void initState() {
    super.initState();
    // 3. Tag unique : adresse + catégorie (un film peut être dans plusieurs listes)
    uniqueHeroTag = widget.movieUrl + widget.movieType.name;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ref.read(heroTagProvider.notifier).state = uniqueHeroTag;
          animateImage = true;
          // Correction : "from: 0" relance l'animation depuis le début,
          // sinon un deuxième toucher ne ferait plus rien
          _controller.forward(from: 0);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          height: 142,
          child: Hero(
            tag: uniqueHeroTag,
            child: CachedNetworkImage(
              imageUrl: widget.movieUrl,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitHeight,
              height: 100,
              width: 142,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, color: Colors.white54),
            )
                .animate(
                    // 1. Ne démarre pas tout seul
                    autoPlay: false,
                    // 2. Contrôleur de l'animation
                    controller: _controller,
                    // 3. À la fin de l'animation...
                    onComplete: (controller) {
                      // 4. ... on ouvre la page de détails
                      if (animateImage) {
                        animateImage = false;
                        widget.onMovieTap(widget.movieId);
                      }
                    })
                // 5. Agrandit l'image de 10 %
                .scaleXY(begin: 1.0, end: 1.1, duration: 600.ms)
                // 6. Petite pause
                .then(delay: 600.ms)
                // 7. Revient à la taille normale
                .scaleXY(begin: 1.1, end: 1.0, duration: 600.ms),
          ),
        ),
      ),
    );
  }
}
