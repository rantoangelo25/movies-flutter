import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movie_data/movie_data.dart';
import 'package:movie_plugin/movie_plugin.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/ui/menus.dart';
import 'package:movies/utils/utils.dart';
import 'package:movies/ui/movie_viewmodel.dart';
import 'package:movies/utils/prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Fichier généré par build_runner (dart run build_runner build)
part 'providers.g.dart';

// Instance de SharedPreferences.
// Le livre écrit "SharedPrefsRef ref", "PrefsRef ref"... ; avec Riverpod 3 : "Ref ref".
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefs(Ref ref) =>
    SharedPreferences.getInstance();

// Notre propre plugin natif (chapitre 17).
// Le livre écrit "MoviePluginRef ref" ; avec Riverpod 3 : "Ref ref".
@Riverpod(keepAlive: true)
MoviePlugin moviePlugin(Ref ref) => MoviePlugin();

// Notre classe Prefs : le plugin MoviePlugin remplace SharedPreferences
// sur Android ; ailleurs (Linux desktop), on garde SharedPreferences
@Riverpod(keepAlive: true)
Future<Prefs> prefs(Ref ref) async {
  if (isAndroid()) {
    return Prefs.plugin(ref.read(moviePluginProvider));
  }
  final sharedPrefs = await ref.read(sharedPrefsProvider.future);
  return Prefs.sharedPreferences(sharedPrefs);
}

// Service réseau TMDB, venant maintenant du package movie_data.
// La clé est lue ici (côté application) puis donnée au service.
@Riverpod(keepAlive: true)
Future<MovieAPIService> movieAPIService(Ref ref) async {
  String apiKey;
  if (!isWeb()) {
    apiKey = dotenv.env['TMDB_KEY']!;
  } else {
    apiKey = await webLoad();
  }
  final service = MovieAPIService(apiKey);
  await service.init();
  return service;
}

// Sur le web, le fichier ".env" ne peut pas être lu : on lit une copie
// nommée "dotenv" (déplacé depuis movie_api_service.dart)
Future<String> webLoad() async {
  String apiKey = '';
  try {
    final dotEnvString = await rootBundle.loadString('dotenv');
    if (dotEnvString.contains('TMDB_KEY')) {
      final parts = dotEnvString.split('=');
      if (parts.length == 2) {
        apiKey = parts[1].trim();
        if (apiKey.contains("'")) {
          apiKey = apiKey.replaceAll("'", '');
        }
      }
    } else {
      apiKey = dotEnvString.trim();
    }
  } catch (e) {
    // Le livre utilise print ; logError évite l'avertissement du linter
    logError(e.toString());
  }
  return apiKey;
}

// Source réseau, construite avec le service TMDB.
// Le livre écrit "NetworkMovieSourceRef ref" ; avec Riverpod 3 : "Ref ref".
@Riverpod(keepAlive: true)
Future<MovieSource> networkMovieSource(Ref ref) async {
  final service = await ref.read(movieAPIServiceProvider.future);
  return NetworkMovieSource(service);
}

// Dépôt : combine la source réseau et la base de données
@Riverpod(keepAlive: true)
Future<MovieSource> movieRepository(Ref ref) async {
  // La base vient maintenant du provider "database" (drift ou Firebase)
  final database = await ref.watch(databaseProvider.future);
  final serviceFuture = ref.watch(networkMovieSourceProvider.future);
  return MovieRepository(await serviceFuture, database);
}

// Le view model ne reçoit plus que le dépôt
@Riverpod(keepAlive: true)
Future<MovieViewModel> movieViewModel(Ref ref) async {
  final repositoryFuture = ref.watch(movieRepositoryProvider.future);
  final model = MovieViewModel(await repositoryFuture);
  await model.setup();
  return model;
}

// Le routeur AutoRoute
@Riverpod(keepAlive: true)
AppRouter appRouter(Ref ref) => AppRouter();

// Base de données drift (derrière l'interface IDatabase)
@Riverpod(keepAlive: true)
Future<IDatabase> driftDatabase(Ref ref) {
  return Future.value(DriftDatabase());
}

// Base de données Cloud Firestore.
// Le livre écrit "FirebaseRef ref" ; avec Riverpod 3 : "Ref ref".
@Riverpod(keepAlive: true)
IDatabase firebase(Ref ref) => FirebaseDatabase();

// Choix de la base de données utilisée par toute l'application.
// Les deux implémentent IDatabase : on change de base sans rien modifier
// d'autre. Ajout : Firebase sur Android, drift ailleurs (Linux desktop).
@Riverpod(keepAlive: true)
Future<IDatabase> database(Ref ref) {
  if (firebaseSupported()) {
    return Future.value(ref.watch(firebaseProvider));
  }
  return ref.watch(driftDatabaseProvider.future);
}

// Service de connexion Google / Firebase
@Riverpod(keepAlive: true)
AuthService authService(Ref ref) =>
    AuthService(serverClientId: dotenv.env['GOOGLE_WEB_CLIENT_ID']);

// Utilisateur connecté (null si personne), mis à jour automatiquement.
// Sur Linux desktop, Firebase n'existe pas : toujours null.
@Riverpod(keepAlive: true)
Stream<User?> authState(Ref ref) {
  if (!firebaseSupported()) {
    return Stream.value(null);
  }
  return ref.watch(authServiceProvider).authStateChanges();
}

// Tag du Hero (StateProvider : import "flutter_riverpod/legacy.dart")
final heroTagProvider = StateProvider<String>((ref) {
  return '';
});

// Texte recherché depuis la boîte de dialogue de recherche
final searchTextProvider = StateProvider<String>((ref) {
  return '';
});

// Onglet actuellement affiché (0 = Home, 1 = Genre, 2 = Favorites)
final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

// Gestionnaire des menus de bureau
@Riverpod(keepAlive: true)
MenuManager menuManager(Ref ref) => MenuManager(ref);

// Bus d'événements : les menus envoient des événements, les écrans les écoutent
@Riverpod(keepAlive: true)
EventBus eventBus(Ref ref) => EventBus();
