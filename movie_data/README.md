# movie_data

Dart package containing the whole **data layer** of the *Movies* app.

## Contents

- **Networking**: `MovieAPIService` (Dio) for the [TMDB](https://www.themoviedb.org/) API — trending, now playing, popular and top rated movies, details, videos, credits, genres and search.
- **Models** generated with freezed and json_serializable (`MovieResults`, `MovieDetails`, `MovieVideos`, `MovieCredits`, `Genre`…).
- **Databases** behind a common `IDatabase` interface:
  - `DriftDatabase`: local SQLite database (drift);
  - `FirebaseDatabase`: Cloud Firestore online database.
- **Sources and repository**: `NetworkMovieSource` and `MovieRepository`, which chooses between the network and the local database.
- **Authentication**: `AuthService` (Firebase Authentication with Google).

## Usage

```yaml
dependencies:
  movie_data:
    path: ../movie_data
```

```dart
import 'package:movie_data/movie_data.dart';

final service = MovieAPIService(apiKey);
await service.init();
final repository = MovieRepository(NetworkMovieSource(service), DriftDatabase());
final trending = await repository.getTrending(1);
```

The TMDB key and the Google client ID are provided by the app: the package does not read any `.env` file.

## Code generation

```bash
flutter pub get
dart run build_runner build
```
