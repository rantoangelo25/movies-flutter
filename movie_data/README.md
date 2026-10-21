# movie_data

Package Dart qui regroupe toute la partie **données** de l'application *Movies*.

## Contenu

- **Réseau** : `MovieAPIService` (Dio) pour l'API [TMDB](https://www.themoviedb.org/) — films tendance, à l'affiche, populaires, mieux notés, détails, vidéos, acteurs, genres, recherche.
- **Modèles** générés avec freezed et json_serializable (`MovieResults`, `MovieDetails`, `MovieVideos`, `MovieCredits`, `Genre`…).
- **Bases de données** derrière une même interface `IDatabase` :
  - `DriftDatabase` : base SQLite locale (drift) ;
  - `FirebaseDatabase` : base en ligne Cloud Firestore.
- **Sources et dépôt** : `NetworkMovieSource` et `MovieRepository`, qui choisit entre le réseau et la base locale.
- **Connexion** : `AuthService` (Firebase Authentication et Google).

## Utilisation

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

La clé TMDB et l'ID client Google sont fournis par l'application : le package ne lit pas de fichier `.env`.

## Génération du code

```bash
flutter pub get
dart run build_runner build
```
