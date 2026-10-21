// Test d'intégration : l'application complète tourne sur l'émulateur.
// Lancement : flutter test integration_test/movie_tests.dart -d emulator-5554
import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/main.dart';
import 'package:movies/ui/widgets/movie_row.dart';
import 'package:movies/utils/utils.dart';

// Ajout : attend (en temps réel) qu'une condition devienne vraie.
// Plus fiable que pumpAndSettle, qui échoue tant qu'une animation
// tourne (indicateur de chargement, carrousel...).
Future<void> pumpUntil(
  WidgetTester tester,
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
    if (condition()) {
      return;
    }
  }
  throw TestFailure('Condition non remplie après ${timeout.inSeconds} s');
}

// Nombre de films déjà chargés dans la liste paginée
int loadedMovies(WidgetTester tester) {
  final list = tester.widget<PagedListView<int, MovieResults>>(
      find.byType(PagedListView<int, MovieResults>));
  return list.state.pages?.expand((page) => page).length ?? 0;
}

void main() async {
  // 1. Prépare le test sur l'appareil (images réellement affichées)
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  // 2. Même initialisation que main.dart (sans Crashlytics)
  putLumberdashToWork(withClients: [
    ColorizeLumberdash(),
  ]);
  if (firebaseSupported()) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  if (!isWeb()) {
    await dotenv.load(fileName: '.env');
  }

  testWidgets('Test scrolling the Movie Listing', (tester) async {
    // 3. Lance l'application complète
    await tester.pumpWidget(const ProviderScope(child: MainApp()));

    // 4. Attend l'accueil et ses boutons "More"
    final moreButtons = find.widgetWithText(TextButton, 'More');
    await pumpUntil(tester, () => moreButtons.evaluate().isNotEmpty);
    expect(moreButtons, findsAtLeast(1));

    // 5. Touche le premier "More" (Trending) et attend la liste
    await tester.tap(moreButtons.first);
    await pumpUntil(tester, () => find.byType(MovieRow).evaluate().isNotEmpty);
    expect(find.byType(PagedListView<int, MovieResults>), findsOneWidget);

    // 6. Fait défiler jusqu'à avoir chargé 6 pages de 20 films (120 films).
    // Ajout : on fait glisser la liste comme un utilisateur (drag) au lieu
    // d'utiliser pagingController, supprimé dans la version 5 du package.
    final listFinder = find.byType(PagedListView<int, MovieResults>);
    final end = DateTime.now().add(const Duration(seconds: 60));
    while (loadedMovies(tester) < 120 && DateTime.now().isBefore(end)) {
      await tester.drag(listFinder, const Offset(0, -3000));
      await tester.pump(const Duration(milliseconds: 500));
    }

    // 7. Vérifie le nombre de films chargés
    expect(loadedMovies(tester), greaterThanOrEqualTo(120));
  });
}
