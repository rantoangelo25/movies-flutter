import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'movie_database.g.dart';

// Table de la configuration des images
class DriftConfigurationImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get baseUrl => text()();
  TextColumn get secureBaseUrl => text()();
  TextColumn get backdropSizes => text()();
  TextColumn get logoSizes => text()();
  TextColumn get posterSizes => text()();
  TextColumn get profileSizes => text()();
  TextColumn get stillSizes => text()();
}

// Table des favoris
class DriftFavorite extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  TextColumn get backdropPath => text()();
  TextColumn get posterPath => text()();
  BoolColumn get favorite => boolean()();
  RealColumn get popularity => real()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
}

// Table des genres
class DriftGenre extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer()();
  TextColumn get name => text()();
}

// La base de données SQLite "Movies" avec ses 3 tables
@DriftDatabase(
  tables: [DriftFavorite, DriftConfigurationImages, DriftGenre],
)
class MovieDatabase extends _$MovieDatabase {
  // drift_flutter choisit la bonne connexion selon la plateforme.
  // Sur le web, il a besoin des fichiers sqlite3.wasm et drift_worker.js
  // placés dans le dossier web/ (chapitre 13).
  MovieDatabase()
      : super(driftDatabase(
          name: 'Movies',
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
          ),
        ));

  @override
  int get schemaVersion => 1;
}
