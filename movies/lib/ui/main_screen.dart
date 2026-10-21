import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:movies/providers.dart';
import 'package:movies/ui/menus.dart';
import 'package:movies/ui/screens/favorites/favorite_screen.dart';
import 'package:movies/ui/screens/genres/genre_screen.dart';
import 'package:movies/ui/screens/genres/search_dialog.dart';
import 'package:movies/ui/screens/home/home_screen.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/utils/utils.dart';

// Largeur à partir de laquelle on affiche le rail de navigation à gauche
// (équivalent de Breakpoints.mediumAndUp du package flutter_adaptive_scaffold)
const double railBreakpoint = 600;

@RoutePage(name: 'MainRoute')
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;
  List<Widget> tabScreens = [];
  StreamSubscription<MenuEvent>? menuSubscription;

  @override
  void initState() {
    super.initState();
    // 1. Les écrans sont créés une seule fois
    tabScreens.add(const HomeScreen());
    tabScreens.add(const GenreScreen());
    tabScreens.add(const FavoriteScreen());
    // 2. Écoute des événements envoyés par les menus
    menuSubscription = ref.read(eventBusProvider).on<MenuEvent>().listen((
      event,
    ) {
      switch (event) {
        case HomeEvent():
          selectTab(0);
        case GenreEvent():
          selectTab(1);
        case FavoritesEvent():
          selectTab(2);
        case QuitEvent():
          SystemNavigator.pop();
        case SearchEvent():
          if (!mounted) return; // l'écran existe-t-il encore ?
          showDialog(
            context: context,
            builder: (context) => const SearchDialog(),
          );
          // 3. Ouvre la boîte de dialogue de recherche
          showDialog(
            context: context,
            builder: (context) => const SearchDialog(),
          );
        case SearchMovieEvent():
          // 4. Transmet le texte à l'écran Genre et l'affiche
          ref.read(searchTextProvider.notifier).state = event.searchText;
          selectTab(1);
      }
    });
  }

  @override
  void dispose() {
    // Ajout : on arrête d'écouter les événements quand l'écran disparaît
    menuSubscription?.cancel();
    super.dispose();
  }

  void selectTab(int index) {
    setState(() {
      currentIndex = index;
      ref.read(currentIndexProvider.notifier).state = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentIndex = ref.watch(currentIndexProvider);
    // Ajout : IndexedStack garde l'état des 3 onglets (résultats de
    // recherche, défilement...) quand on passe de l'un à l'autre
    final body = IndexedStack(index: currentIndex, children: tabScreens);
    // Largeur de la fenêtre ou de l'écran
    final isWide = MediaQuery.sizeOf(context).width >= railBreakpoint;
    final content = isWide
        // Grand écran : rail de navigation à gauche
        ? Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  backgroundColor: Colors.black,
                  labelType: NavigationRailLabelType.all,
                  selectedIndex: currentIndex,
                  onDestinationSelected: selectTab,
                  indicatorColor: posterBorder,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: const IconThemeData(color: posterBorder),
                  selectedLabelTextStyle: const TextStyle(color: Colors.white),
                  unselectedLabelTextStyle: const TextStyle(
                    color: posterBorder,
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Symbols.genres),
                      label: Text('Genre'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                ),
                Expanded(child: body),
              ],
            ),
          )
        // Petit écran : barre de navigation en bas
        : Scaffold(
            body: body,
            // Correction : le livre entoure la barre d'un SizedBox de 80 pixels,
            // trop petit sur certains écrans (« BOTTOM OVERFLOWED »).
            // Sans SizedBox, la barre prend la hauteur dont elle a besoin.
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: selectTab,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Symbols.genres),
                  label: 'Genre',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
              ],
            ),
          );
    // Sur macOS, les raccourcis passent par la barre de menus.
    // Ajout : ailleurs (Linux, Windows...), les mêmes raccourcis avec Ctrl,
    // pour pouvoir tester la boîte de recherche sans macOS.
    if (isMac()) {
      return content;
    }
    final bus = ref.read(eventBusProvider);
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyH, control: true): () =>
            bus.fire(HomeEvent()),
        const SingleActivator(LogicalKeyboardKey.keyG, control: true): () =>
            bus.fire(GenreEvent()),
        const SingleActivator(LogicalKeyboardKey.keyF, control: true): () =>
            bus.fire(FavoritesEvent()),
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): () =>
            bus.fire(SearchEvent()),
      },
      child: Focus(autofocus: true, child: content),
    );
  }
}
