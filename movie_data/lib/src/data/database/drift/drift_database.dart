import 'package:drift/drift.dart';
import 'package:movie_data/src/data/database/database_interface.dart';
import 'package:movie_data/src/data/database/drift/movie_database.dart';
import 'package:movie_data/src/data/database/models/database_models.dart';

// Implémentation de IDatabase avec drift
class DriftDatabase implements IDatabase {
  final MovieDatabase movieDatabase = MovieDatabase();

  DriftDatabase();

  @override
  Future deleteDatabase() async {}

  @override
  Future<List<DBFavorite>> getFavorites() async {
    // 1. drift génère un "manager" pour chaque table
    final favorites = await movieDatabase.managers.driftFavorite.get();
    final dbFavorites = <DBFavorite>[];
    for (final favorite in favorites) {
      // 2. Conversion de chaque ligne en DBFavorite
      dbFavorites.add(DBFavorite(
          id: favorite.id,
          movieId: favorite.movieId,
          backdropPath: favorite.backdropPath,
          posterPath: favorite.posterPath,
          favorite: favorite.favorite,
          popularity: favorite.popularity,
          releaseDate: favorite.releaseDate,
          title: favorite.title,
          overview: favorite.overview));
    }
    return dbFavorites;
  }

  @override
  Future<List<DBMovieGenre>> getGenres() async {
    final genres = await movieDatabase.managers.driftGenre.get();
    final dbGenres = <DBMovieGenre>[];
    for (final genre in genres) {
      dbGenres.add(DBMovieGenre(
        id: genre.id,
        remoteId: genre.remoteId,
        name: genre.name,
      ));
    }
    return dbGenres;
  }

  @override
  Future<DBConfiguration?> getMovieConfiguration() async {
    final images =
        await movieDatabase.managers.driftConfigurationImages.get();
    final dbImages = <DBConfigurationImages>[];
    for (final image in images) {
      dbImages.add(DBConfigurationImages(
        baseUrl: image.baseUrl,
        secureBaseUrl: image.secureBaseUrl,
        backdropSizes: image.backdropSizes.split(','),
        logoSizes: image.logoSizes.split(','),
        posterSizes: image.posterSizes.split(','),
        profileSizes: image.profileSizes.split(','),
        stillSizes: image.stillSizes.split(','),
      ));
    }
    if (dbImages.isEmpty) {
      return null;
    }
    // changeKeys n'est pas utile ici
    return DBConfiguration(id: 1, images: dbImages[0], changeKeys: []);
  }

  @override
  Future<DBConfiguration?> getMovieConfigurationById(int id) async {
    return getMovieConfiguration();
  }

  @override
  Future<bool> removeFavorite(int id) async {
    // Supprime la ligne qui a cet identifiant
    return await movieDatabase.driftFavorite
            .deleteWhere((table) => table.id.equals(id)) !=
        -1;
  }

  @override
  Future saveFavorite(DBFavorite favorite) async {
    // Ajout : insertOrReplace évite une erreur si le film est déjà enregistré
    await movieDatabase.managers.driftFavorite.create(
        (x) => DriftFavoriteData(
              id: favorite.id,
              movieId: favorite.movieId,
              backdropPath: favorite.backdropPath,
              posterPath: favorite.posterPath,
              favorite: favorite.favorite,
              popularity: favorite.popularity,
              releaseDate: favorite.releaseDate,
              title: favorite.title,
              overview: favorite.overview,
            ),
        mode: InsertMode.insertOrReplace);
  }

  @override
  Future saveGenres(List<DBMovieGenre> genres) async {
    for (final genre in genres) {
      await movieDatabase.managers.driftGenre.create(
          (x) => DriftGenreData(
              id: genre.id, remoteId: genre.remoteId, name: genre.name),
          mode: InsertMode.insertOrReplace);
    }
  }

  @override
  Future saveMovieConfiguration(DBConfiguration configuration) async {
    await movieDatabase.managers.driftConfigurationImages
        .create((x) => DriftConfigurationImagesCompanion.insert(
              baseUrl: configuration.images.baseUrl,
              secureBaseUrl: configuration.images.secureBaseUrl,
              backdropSizes: configuration.images.backdropSizes.join(','),
              logoSizes: configuration.images.logoSizes.join(','),
              posterSizes: configuration.images.posterSizes.join(','),
              profileSizes: configuration.images.profileSizes.join(','),
              stillSizes: configuration.images.stillSizes.join(','),
            ));
  }

  @override
  Stream<List<DBFavorite>> streamFavorites() {
    // watch() renvoie un Stream mis à jour à chaque changement de la table
    return movieDatabase.managers.driftFavorite.watch().map((dbFavorites) {
      final favorites = <DBFavorite>[];
      for (final favorite in dbFavorites) {
        favorites.add(DBFavorite(
            id: favorite.id,
            movieId: favorite.movieId,
            backdropPath: favorite.backdropPath,
            posterPath: favorite.posterPath,
            favorite: favorite.favorite,
            popularity: favorite.popularity,
            releaseDate: favorite.releaseDate,
            title: favorite.title,
            overview: favorite.overview));
      }
      return favorites;
    });
  }
}
