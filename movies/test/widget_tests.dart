// Tests de widgets : chaque widget est affiché en mémoire (sans appareil)
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/ui/screens/movie_detail/button_row.dart';
import 'package:movies/ui/widgets/text_icon.dart';

void main() {
  testWidgets('Test TextIcon', (WidgetTester tester) async {
    // MaterialApp + Scaffold : IconButton a besoin d'un environnement Material
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextIcon(
          text: const Text('Test'),
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outlined,
              size: 24,
            ),
          ),
        ),
      ),
    ));
    // Le texte et l'icône doivent être affichés une fois chacun
    final textFinder = find.text('Test');
    expect(textFinder, findsOneWidget);
    final iconFinder = find.byIcon(Icons.favorite_outlined);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Test ButtonRow', (WidgetTester tester) async {
    // Ajout : un StatefulBuilder joue le rôle de l'écran parent, pour que
    // le toucher sur le cœur change vraiment l'état "favori" (dans le
    // livre, le callback ne fait rien et l'état ne change jamais).
    var favorite = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: StatefulBuilder(
          builder: (context, setState) => ButtonRow(
            favoriteSelected: favorite,
            onFavoriteSelected: () => setState(() => favorite = !favorite),
          ),
        ),
      ),
    ));

    // 1. Le texte "Favorite" existe
    final textFinder = find.text('Favorite');
    expect(textFinder, findsOneWidget);

    // 2. On remonte au TextIcon qui le contient, puis on descend au bouton
    final textIconFinder =
        find.ancestor(of: textFinder, matching: find.byType(TextIcon));
    final iconButton = find.descendant(
        of: textIconFinder, matching: find.byType(IconButton));
    expect(iconButton, findsOneWidget);

    // 3. Pas encore favori : cœur vide et blanc
    var iconFinder =
        find.descendant(of: iconButton, matching: find.byType(Icon));
    var icon = tester.widget<Icon>(iconFinder);
    expect(icon.icon, Icons.favorite_border);
    expect(icon.color, Colors.white);

    // 4. Toucher le cœur. pumpAndSettle attendrait indéfiniment, car
    // l'animation du cœur se répète sans fin : on avance de 500 ms.
    await tester.tap(iconButton);
    await tester.pump(const Duration(milliseconds: 500));

    // 5. Favori : cœur plein (animé entre le blanc et le rouge)
    expect(favorite, true);
    iconFinder = find.descendant(of: iconButton, matching: find.byType(Icon));
    icon = tester.widget<Icon>(iconFinder);
    expect(icon.icon, Icons.favorite_outlined);
  });
}
