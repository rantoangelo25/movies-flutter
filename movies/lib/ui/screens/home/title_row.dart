import 'package:flutter/material.dart';

// 1. Fonction appelée quand on clique sur "More"
typedef OnMoreClicked = void Function();

class TitleRow extends StatelessWidget {
  final String text;
  final OnMoreClicked onMoreClicked;

  const TitleRow({super.key, required this.text, required this.onMoreClicked});

  @override
  Widget build(BuildContext context) {
    // 2. Une ligne avec plusieurs enfants
    return Row(
      // 3. La ligne prend toute la largeur
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16.0, 0.0, 8.0),
          // 4. Le titre passé en paramètre
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        // 5. Pousse le bouton vers la droite
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16.0, 8.0, 0.0),
          // 6. Bouton "More"
          child: TextButton(
            onPressed: onMoreClicked,
            child: const Text(
              'More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}