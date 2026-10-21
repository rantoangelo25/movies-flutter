import 'package:flutter/material.dart';
import 'package:movies/ui/widgets/text_icon.dart';
import 'package:movies/utils/utils.dart';

typedef OnFavoriteSelected = void Function();

class ButtonRow extends StatefulWidget {
  final bool favoriteSelected;
  final OnFavoriteSelected onFavoriteSelected;

  const ButtonRow({
    super.key,
    required this.favoriteSelected,
    required this.onFavoriteSelected,
  });

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

// TickerProviderStateMixin : nécessaire pour PLUSIEURS contrôleurs
class _ButtonRowState extends State<ButtonRow> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    // 1. Contrôleur de taille, qui se répète en aller-retour
    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    // 2. Taille : de 1 à 1,5 fois
    _sizeAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut),
    );
    // 3. Contrôleur de couleur
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    // 4. Couleur : du blanc au rouge
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.red).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 0, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextIcon(
            text: Text(
              'Favorite',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            icon: IconButton(
              onPressed: () {
                widget.onFavoriteSelected();
              },
              // Cœur qui bat (taille + couleur) quand il est sélectionné
              icon: widget.favoriteSelected
                  ? AnimatedBuilder(
                      animation: Listenable.merge([
                        _sizeController,
                        _colorController,
                      ]),
                      builder: (context, child) {
                        return Icon(
                          Icons.favorite_outlined,
                          size: 21 * _sizeAnimation.value,
                          color: _colorAnimation.value,
                        );
                      },
                    )
                  : const Icon(Icons.favorite_border, color: Colors.white),
            ),
          ),
          addHorizontalSpace(32),
          TextIcon(
            text: Text('Rate', style: Theme.of(context).textTheme.labelSmall),
            // TEST CRASHLYTICS (chapitre 15) : provoque volontairement
            // une erreur. Une fois le test fait, remets : onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_up_alt_outlined,
                color: Colors.white,
              ),
            ),
          ),
          addHorizontalSpace(32),
          TextIcon(
            text: Text('Share', style: Theme.of(context).textTheme.labelSmall),
            // À implémenter par toi (exercice du livre)
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ios_share, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
