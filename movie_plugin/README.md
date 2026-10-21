# movie_plugin

Plugin Flutter qui réimplémente, pour Android, un stockage simple de préférences
(équivalent de `shared_preferences`), à l'aide des `SharedPreferences` natives d'Android.

## Fonctionnement

Le code Dart envoie chaque appel au code natif Kotlin par un `MethodChannel` nommé `movie_plugin` :

```
MoviePlugin (Dart) ──invokeMethod──▶ MethodChannel ──▶ MoviePlugin.kt (Kotlin) ──▶ SharedPreferences
```

| Fichier | Rôle |
|---|---|
| `lib/movie_plugin.dart` | Point d'entrée utilisé par l'application |
| `lib/movie_plugin_platform_interface.dart` | Interface commune aux plateformes |
| `lib/movie_plugin_method_channel.dart` | Implémentation par `MethodChannel` |
| `android/src/main/kotlin/com/bpb/movie_plugin/MoviePlugin.kt` | Code natif Android |

## Méthodes

`getString` / `setString`, `getInt` / `setInt`, `getDouble` / `setDouble`,
`getBool` / `setBool`, `containsKey`, `clear`.

```dart
final plugin = MoviePlugin();
await plugin.setString('GenreKey', 'Action,Comedy');
final genres = await plugin.getString('GenreKey');
```

## Plateformes

| Android | iOS | Linux / Windows / macOS / Web |
|:---:|:---:|:---:|
| ✅ | ❌ (non réalisé : nécessite un Mac) | ❌ |

## Exemple et tests

```bash
cd example && flutter run      # application de démonstration
flutter test                   # tests unitaires (plateforme simulée)
```
