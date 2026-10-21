# movies — application

Application Flutter *Movies* : interface, navigation, gestion de l'état et tests.
La présentation complète du projet se trouve dans le [README principal](../README.md).

## Structure

| Dossier | Contenu |
|---|---|
| `lib/main.dart` | Démarrage : `.env`, Firebase, Crashlytics, fenêtre desktop |
| `lib/providers.dart` | Providers Riverpod (service TMDB, dépôt, base de données, connexion, préférences) |
| `lib/router/` | Routes AutoRoute (onglets, détails, vidéo, liste) |
| `lib/ui/screens/` | Écrans : accueil, genre, détails, favoris, vidéo, liste paginée |
| `lib/ui/widgets/` | Widgets réutilisables |
| `lib/ui/theme/` | Couleurs, polices et thème |
| `lib/ui/movie_viewmodel.dart` | View model (accès aux données via le dépôt) |
| `lib/utils/` | Utilitaires et classe `Prefs` |
| `test/` | Tests de widgets |
| `integration_test/` | Test d'intégration |

## Dépendances locales

```yaml
movie_data:
  path: ../movie_data
movie_plugin:
  path: ../movie_plugin
```

## Commandes utiles

```bash
dart run build_runner build      # providers et routes
flutter run                      # lancer en debug
flutter test test/widget_tests.dart
flutter build apk --release      # version finale signée
```

Les fichiers `.env`, `android/key.properties`, le keystore et la configuration Firebase
ne sont pas publiés : voir le README principal pour les recréer.
