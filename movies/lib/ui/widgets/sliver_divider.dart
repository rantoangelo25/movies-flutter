import 'package:flutter/material.dart';
import 'package:movies/ui/theme/theme.dart';

// Un séparateur utilisable dans une liste de slivers
class SliverDivider extends StatelessWidget {
  const SliverDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      // Convertit un widget normal (Divider) en sliver
      sliver: SliverToBoxAdapter(
        child: Divider(
          color: primaryButton,
          thickness: 1.0,
        ),
      ),
    );
  }
}
