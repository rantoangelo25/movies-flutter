import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/utils/utils.dart';

// Liste horizontale des bandes-annonces d'un film
class Trailer extends ConsumerStatefulWidget {
  final List<MovieVideo>? movieVideos;
  final OnMovieVideoTap onVideoTap;

  const Trailer({this.movieVideos, required this.onVideoTap, super.key});

  @override
  ConsumerState<Trailer> createState() => _TrailerState();
}

class _TrailerState extends ConsumerState<Trailer> {
  @override
  Widget build(BuildContext context) {
    // 1. Certains films n'ont pas de bande-annonce
    if (widget.movieVideos == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      // 2. Hauteur fixe de 120 pixels
      child: SizedBox(
        height: 120,
        // 3. Liste horizontale, chaque élément fait 166 pixels
        child: ListView.builder(
          itemExtent: 166,
          scrollDirection: Axis.horizontal,
          itemCount: widget.movieVideos!.length,
          itemBuilder: (context, index) {
            final movieVideo = widget.movieVideos![index];
            // 4. Envoie la vidéo touchée
            return GestureDetector(
              onTap: () {
                widget.onVideoTap(movieVideo);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: SizedBox(
                  width: 166,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 5. Miniature (les en-têtes servent pour le web)
                      CachedNetworkImage(
                        httpHeaders: const {'Access-Control-Allow-Origin': '*'},
                        imageUrl: youtubeImageFromId(movieVideo.key),
                        alignment: Alignment.topLeft,
                        fit: BoxFit.fitHeight,
                        height: 98,
                        // Image impossible à charger (CORS sur le web)
                        errorWidget: (_, _, _) => const Placeholder(),
                      ),
                      // 6. Titre de la bande-annonce
                      AutoSizeText(
                        movieVideo.name,
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 1,
                        minFontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
