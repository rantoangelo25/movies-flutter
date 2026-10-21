import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Connexion avec un compte Google via Firebase Authentication.
// Le livre utilise GoogleSignIn().signIn(), supprimé dans la version 7
// de google_sign_in : on utilise GoogleSignIn.instance, initialize()
// puis authenticate().
class AuthService {
  // ID client Web du projet Firebase, fourni par l'application
  // (le package ne lit pas le fichier .env)
  final String? serverClientId;
  Future<void>? _initialization;

  AuthService({this.serverClientId});

  // initialize() ne doit être appelé qu'une seule fois
  Future<void> _ensureInitialized() {
    return _initialization ??= GoogleSignIn.instance.initialize(
      serverClientId: serverClientId,
    );
  }

  // Utilisateur actuellement connecté (null si personne)
  User? get currentUser => FirebaseAuth.instance.currentUser;

  // Stream qui signale chaque connexion / déconnexion
  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    await _ensureInitialized();
    // 1. Ouvre la fenêtre de choix du compte Google
    final googleUser = await GoogleSignIn.instance.authenticate();
    // 2. Récupère le jeton d'identité
    final googleAuth = googleUser.authentication;
    // 3. Crée l'identifiant Firebase à partir de ce jeton
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    // 4. Connexion à Firebase
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _ensureInitialized();
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
