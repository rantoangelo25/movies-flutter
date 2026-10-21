# movies — app

The *Movies* Flutter app: UI, navigation, state management and tests.
See the [main README](../README.md) for the full project overview.

## Structure

| Folder | Contents |
|---|---|
| `lib/main.dart` | Startup: `.env`, Firebase, Crashlytics, desktop window |
| `lib/providers.dart` | Riverpod providers (TMDB service, repository, database, sign-in, preferences) |
| `lib/router/` | AutoRoute routes (tabs, details, video, listing) |
| `lib/ui/screens/` | Screens: home, genre, details, favorites, video, paginated listing |
| `lib/ui/widgets/` | Reusable widgets |
| `lib/ui/theme/` | Colors, fonts and theme |
| `lib/ui/movie_viewmodel.dart` | View model (data access through the repository) |
| `lib/utils/` | Utilities and the `Prefs` class |
| `test/` | Widget tests |
| `integration_test/` | Integration test |

## Local dependencies

```yaml
movie_data:
  path: ../movie_data
movie_plugin:
  path: ../movie_plugin
```

## Useful commands

```bash
dart run build_runner build      # providers and routes
flutter run                      # run in debug mode
flutter test test/widget_tests.dart
flutter build apk --release      # signed release build
```

The `.env` file, `android/key.properties`, the keystore and the Firebase configuration
are not published: see the main README to recreate them.
