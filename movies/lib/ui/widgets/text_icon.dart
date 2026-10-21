import 'package:flutter/material.dart';
import 'package:movies/utils/utils.dart';

// Un bouton icône avec un texte en dessous (réutilisable)
class TextIcon extends StatelessWidget {
  final Text text;
  final IconButton icon;

  const TextIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        addVerticalSpace(4),
        text,
      ],
    );
  }
}
