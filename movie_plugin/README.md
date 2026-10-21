# movie_plugin

Flutter plugin that re-implements, for Android, simple key/value preference storage
(similar to `shared_preferences`), using Android's native `SharedPreferences`.

## How it works

The Dart code sends each call to the native Kotlin code through a `MethodChannel` named `movie_plugin`:

```
MoviePlugin (Dart) ──invokeMethod──▶ MethodChannel ──▶ MoviePlugin.kt (Kotlin) ──▶ SharedPreferences
```

| File | Purpose |
|---|---|
| `lib/movie_plugin.dart` | Entry point used by the app |
| `lib/movie_plugin_platform_interface.dart` | Common platform interface |
| `lib/movie_plugin_method_channel.dart` | `MethodChannel` implementation |
| `android/src/main/kotlin/com/bpb/movie_plugin/MoviePlugin.kt` | Native Android code |

## Methods

`getString` / `setString`, `getInt` / `setInt`, `getDouble` / `setDouble`,
`getBool` / `setBool`, `containsKey`, `clear`.

```dart
final plugin = MoviePlugin();
await plugin.setString('GenreKey', 'Action,Comedy');
final genres = await plugin.getString('GenreKey');
```

## Platforms

| Android | iOS | Linux / Windows / macOS / Web |
|:---:|:---:|:---:|
| ✅ | ❌ (not implemented: requires a Mac) | ❌ |

## Example and tests

```bash
cd example && flutter run      # demo app
flutter test                   # unit tests (mocked platform)
```
