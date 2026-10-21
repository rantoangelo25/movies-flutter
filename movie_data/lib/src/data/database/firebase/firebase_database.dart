import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movie_data/src/data/database/database_interface.dart';
import 'package:movie_data/src/data/database/models/configuration.dart';
import 'package:movie_data/src/data/database/models/favorite.dart';
import 'package:movie_data/src/data/database/models/genre.dart';

// Noms des collections Firestore
const favorites = 'favorites';
const genres = 'genres';
const configuration = 'configuration';
const images = 'images';

// Base de données en ligne Cloud Firestore.
// Elle implémente la même interface IDatabase que drift : on peut donc
// passer de l'une à l'autre en changeant seulement un provider.
// Firebase est initialisé une seule fois dans main.dart (le livre prévoit
// aussi une méthode initialize() ici : l'appeler une deuxième fois
// provoquerait une erreur « duplicate app »).
class FirebaseDatabase implements IDatabase {
  final firebase = FirebaseFirestore.instance;
  final favoritesCollection = FirebaseFirestore.instance.collection(favorites);
  final genresCollection = FirebaseFirestore.instance.collection(genres);
  final configurationCollection =
      FirebaseFirestore.instance.collection(configuration);
  final imagesCollection = FirebaseFirestore.instance.collection(images);

  // On ne supprime pas une base serveur depuis l'application
  @override
  Future deleteDatabase() {
    return Future.value(null);
  }

  // Lit tous les documents de la collection "favorites"
  @override
  Future<List<DBFavorite>> getFavorites() async {
    final favorites = <DBFavorite>[];
    final querySnapshot = await favoritesCollection.get();
    for (final doc in querySnapshot.docs) {
      var favorite = DBFavorite.fromJson(doc.data());
      favorite = favorite.copyWith(id: int.tryParse(doc.id) ?? 0);
      favorites.add(favorite);
    }
    return favorites;
  }

  // snapshots() : Stream mis à jour à chaque changement de la collection
  @override
  Stream<List<DBFavorite>> streamFavorites() {
    return favoritesCollection
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((doc) => DBFavorite.fromJson(doc.data()))
            .toList())
        .asBroadcastStream();
  }

  // Ajout : chaque favori est enregistré dans un document dont l'identifiant
  // est celui du film (le livre utilise add(), qui crée un document à
  // identifiant aléatoire et peut enregistrer le même film plusieurs fois)
  @override
  Future<bool> removeFavorite(int id) async {
    await favoritesCollection.doc(id.toString()).delete();
    return true;
  }

  @override
  Future saveFavorite(DBFavorite favorite) async {
    await favoritesCollection
        .doc(favorite.id.toString())
        .set(favorite.toJson());
    return favorite.id.toString();
  }

  @override
  Future<List<DBMovieGenre>> getGenres() async {
    final genres = <DBMovieGenre>[];
    final querySnapshot = await genresCollection.get();
    for (final doc in querySnapshot.docs) {
      var genre = DBMovieGenre.fromJson(doc.data());
      genre = genre.copyWith(id: int.tryParse(doc.id) ?? 0);
      genres.add(genre);
    }
    return genres;
  }

  // Même principe : un document par genre (identifiant = id du genre)
  @override
  Future saveGenres(List<DBMovieGenre> genres) async {
    for (final genre in genres) {
      await genresCollection.doc(genre.id.toString()).set(genre.toJson());
    }
  }

  @override
  Future<DBConfiguration?> getMovieConfiguration() async {
    final querySnapshot = await configurationCollection.get();
    for (final doc in querySnapshot.docs) {
      var configuration = DBConfiguration.fromJson(doc.data());
      configuration = configuration.copyWith(id: int.tryParse(doc.id) ?? 0);
      final imagesSnapshot = await imagesCollection.get();
      if (imagesSnapshot.docs.isNotEmpty) {
        final images =
            DBConfigurationImages.fromJson(imagesSnapshot.docs[0].data());
        configuration = configuration.copyWith(images: images);
      }
      return configuration;
    }
    return Future.value(null);
  }

  @override
  Future<DBConfiguration?> getMovieConfigurationById(int id) async {
    final docRef = await configurationCollection.doc(id.toString()).get();
    final data = docRef.data();
    if (data != null) {
      return DBConfiguration.fromJson(data);
    }
    return null;
  }

  // La configuration contient un objet "images" imbriqué : le fichier
  // build.yaml (explicit_to_json) est nécessaire pour l'enregistrer
  @override
  Future saveMovieConfiguration(DBConfiguration configuration) async {
    final configJson = configuration.toJson();
    // Le livre utilise print ; logMessage évite l'avertissement du linter
    logMessage(configJson.toString());
    await configurationCollection
        .doc(configuration.id.toString())
        .set(configJson);
  }
}
