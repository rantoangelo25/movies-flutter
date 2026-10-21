import 'package:flutter/material.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/ui/theme/theme.dart';

// Rangée de genres qui arrive de la droite avec un rebond
class GenreRow extends StatefulWidget {
  // Genres du film renvoyés par TMDB
  final List<Genre> genres;

  const GenreRow({super.key, required this.genres});

  @override
  State<GenreRow> createState() => _GenreRowState();
}

class _GenreRowState extends State<GenreRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // démarre dès l'affichage
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // commence hors écran à droite
      end: Offset.zero, // termine à sa place normale
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // effet de rebond
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 16),
      child: SizedBox(
        height: 34,
        child: SlideTransition(
          position: _offsetAnimation,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.genres
                .map((genre) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: buttonGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        genre.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
