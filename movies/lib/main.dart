import 'dart:ui';

import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/providers.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  putLumberdashToWork(withClients: [
    ColorizeLumberdash(),
  ]);
  // Firebase (uniquement là où il est configuré : Android)
  if (firebaseSupported()) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Envoie les erreurs Flutter à Crashlytics.
    // Ajout : presentError garde aussi l'affichage de l'erreur dans la
    // console de VS Code (sinon on ne verrait plus les erreurs en debug).
    FlutterError.onError = (errorDetails) {
      FlutterError.presentError(errorDetails);
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Erreurs asynchrones non gérées par Flutter
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
  // Le fichier .env n'est pas lisible sur le web (voir MovieAPIService)
  if (!isWeb()) {
    await dotenv.load(fileName: '.env');
  }
  // Sur ordinateur : taille de départ et taille minimale de la fenêtre
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(700, 600));
    await DesktopWindow.setMinWindowSize(const Size(700, 600));
  }
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final menuManager = ref.watch(menuManagerProvider);
    final app = MaterialApp.router(
      routerConfig: router.config(),
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: createTheme(),
    );
    // PlatformMenuBar (barre de menus native) ne fonctionne que sur macOS.
    // La partie Windows du livre (plugin "menubar") n'est pas reprise :
    // elle ne concerne que Windows.
    if (isMac()) {
      return PlatformMenuBar(
        menus: menuManager.createMenus(),
        child: app,
      );
    }
    return app;
  }
}
