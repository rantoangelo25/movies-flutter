import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_data/movie_data.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:movies/providers.dart';
import 'package:movies/ui/theme/theme.dart';
import 'package:movies/utils/utils.dart';

// Bouton de compte : « Se connecter » si personne n'est connecté,
// sinon la photo de l'utilisateur avec un menu (nom, e-mail, déconnexion).
// Rien n'est affiché là où Firebase n'est pas disponible (Linux desktop).
class AccountButton extends ConsumerWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!firebaseSupported()) {
      return emptyWidget;
    }
    final userAsync = ref.watch(authStateProvider);
    return userAsync.when(
      loading: () => const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (e, st) => emptyWidget,
      data: (user) {
        // Personne n'est connecté : bouton de connexion
        if (user == null) {
          return OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: posterBorder),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            icon: const Icon(Icons.login, size: 18),
            label: const Text('Sign in'),
            onPressed: () => signIn(context, ref),
          );
        }
        // Utilisateur connecté : avatar + menu
        final photoUrl = user.photoURL;
        return PopupMenuButton<String>(
          tooltip: user.displayName ?? user.email ?? '',
          onSelected: (value) {
            if (value == 'signout') {
              ref.read(authServiceProvider).signOut();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<String>(
              enabled: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.displayName ?? 'Utilisateur',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  Text(user.email ?? '',
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem<String>(
              value: 'signout',
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 8),
                  Text('Sign out'),
                ],
              ),
            ),
          ],
          child: CircleAvatar(
            radius: 18,
            backgroundColor: buttonGrey,
            backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
            child: photoUrl == null
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
        );
      },
    );
  }

  Future<void> signIn(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final credential = await ref.read(authServiceProvider).signInWithGoogle();
      final name = credential.user?.displayName ?? '';
      messenger.showSnackBar(SnackBar(content: Text('Bienvenue $name !')));
    } on GoogleSignInException catch (e) {
      // L'utilisateur a fermé la fenêtre : ce n'est pas une erreur
      if (e.code != GoogleSignInExceptionCode.canceled) {
        logError('Google sign in failed: $e');
        messenger.showSnackBar(
            const SnackBar(content: Text('Connexion Google impossible')));
      }
    } catch (e) {
      logError('Sign in failed: $e');
      messenger.showSnackBar(
          const SnackBar(content: Text('Connexion impossible')));
    }
  }
}
