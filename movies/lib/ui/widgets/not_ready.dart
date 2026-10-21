import 'package:flutter/material.dart';

// Indicateur de chargement réutilisable
class NotReady extends StatelessWidget {
  const NotReady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
