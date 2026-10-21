/// Package movie_data : toute la partie données (réseau TMDB, modèles,
/// bases de données drift et Firestore, dépôt) de l'application Movies.
///
/// Fichier « baril » : seuls les fichiers exportés ici sont visibles par
/// les projets qui utilisent le package (le reste de lib/src est caché).
library;

export 'src/data/models/models.dart';
export 'src/data/database/models/database_models.dart';
export 'src/data/database/firebase/firebase_database.dart';
export 'src/data/database/firebase/firebase_auth.dart';
export 'src/data/database/drift/drift_database.dart';
export 'src/data/repository/movie_repository.dart';
export 'src/data/sources/database_source.dart';
export 'src/data/sources/movie_source.dart';
export 'src/data/sources/network_movie_source.dart';
export 'src/network/movie_api_service.dart';
export 'src/data/database/database_interface.dart';

// Ajout : types de Firebase et Google utilisés par l'application
// (utilisateur connecté, erreurs de connexion). Les exporter ici évite
// à l'application de dépendre directement de ces packages.
export 'package:firebase_auth/firebase_auth.dart' show User, UserCredential;
export 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignInException, GoogleSignInExceptionCode;
