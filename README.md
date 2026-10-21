<p align="center">
  <img src="docs/screenshots/icone.png" width="120" alt="Icône de l'application Movies">
</p>

<h1 align="center">Movies</h1>

<p align="center">
  Application mobile Flutter pour découvrir des films, regarder leurs bandes-annonces et gérer ses favoris.<br>
  Projet de travaux pratiques réalisé en suivant le livre <i>Mastering Flutter</i> de Kevin Moore.
</p>

---

## Aperçu

| Accueil | Détails | Recherche | Liste « More » | Favoris |
|:---:|:---:|:---:|:---:|:---:|
| <img src="docs/screenshots/accueil.png" width="160"> | <img src="docs/screenshots/details.png" width="160"> | <img src="docs/screenshots/recherche.png" width="160"> | <img src="docs/screenshots/liste.png" width="160"> | <img src="docs/screenshots/favoris.png" width="160"> |

Version Linux desktop, avec le rail de navigation sur grand écran :

<img src="docs/screenshots/linux.png" width="480">

## Fonctionnalités

- **Accueil** : carrousel des films à l'affiche et rangées *Trending*, *Popular* et *Top Rated* (données réelles de l'API TMDB).
- **Listes complètes** de chaque catégorie avec **défilement infini**.
- **Recherche** par titre et par genre, avec tri (A-Z, Z-A, popularité, année).
- **Page de détails** : image, genres, résumé, **bandes-annonces YouTube** et acteurs.
- **Favoris** enregistrés dans le cloud (**Cloud Firestore**), synchronisés en temps réel.
- **Connexion avec un compte Google** (Firebase Authentication).
- **Suivi des plantages** avec Firebase Crashlytics.
- **Animations** : transitions Hero, fondus, rebonds, cœur animé.
- **Interface adaptative** : barre de navigation en bas sur téléphone, rail à gauche sur grand écran.
- **Plugin natif Kotlin** (`movie_plugin`) pour mémoriser les genres choisis.

## Organisation du dépôt

Le dépôt contient trois projets Flutter, placés côte à côte :

| Dossier | Rôle |
|---|---|
| [`movies/`](movies) | L'application (interface, navigation, view model, tests) |
| [`movie_data/`](movie_data) | Package Dart : API TMDB, modèles, bases de données drift et Firestore, dépôt (repository) |
| [`movie_plugin/`](movie_plugin) | Plugin natif Android (Kotlin) : enregistrement de préférences simples |

```
movies/                 Application
 ├─ lib/
 │   ├─ main.dart
 │   ├─ providers.dart  Providers Riverpod
 │   ├─ router/         Navigation (AutoRoute)
 │   ├─ ui/             Écrans, widgets, thème, view model
 │   └─ utils/          Fonctions utilitaires, préférences
 ├─ test/               Tests de widgets
 └─ integration_test/   Test d'intégration
movie_data/             Package des données
movie_plugin/           Plugin natif
```

## Technologies

| Domaine | Outils |
|---|---|
| Framework | Flutter 3.47, Dart 3.13 |
| Gestion de l'état | Riverpod 3 (avec génération de code) |
| Navigation | AutoRoute (liens profonds `movieapp://bpb.com/details/<id>`) |
| Réseau | Dio, API [The Movie Database (TMDB)](https://www.themoviedb.org/) |
| Modèles | freezed, json_serializable |
| Bases de données | drift (SQLite local), Cloud Firestore |
| Firebase | Authentication (Google), Firestore, Crashlytics |
| Interface | cached_network_image, card_swiper, flutter_animate, google_fonts, infinite_scroll_pagination, pod_player |
| Tests | flutter_test, integration_test |

## Installation

### Prérequis

- Flutter 3.47 ou plus récent ([installation](https://docs.flutter.dev/get-started/install))
- Android Studio (SDK Android et émulateur)
- Une clé d'API [TMDB](https://www.themoviedb.org/settings/api) (gratuite)
- Un projet [Firebase](https://console.firebase.google.com/) avec Cloud Firestore et la connexion Google activés

### 1. Cloner le dépôt

```bash
git clone https://github.com/<votre-pseudo>/movies-flutter.git
cd movies-flutter
```

### 2. Fichier `.env`

Les clés ne sont pas publiées dans le dépôt. Copiez le modèle puis complétez-le :

```bash
cd movies
cp .env.example .env
```

```
TMDB_KEY='votre_cle_tmdb'
GOOGLE_WEB_CLIENT_ID='votre_id_client_web.apps.googleusercontent.com'
```

### 3. Configuration Firebase

Les fichiers de configuration Firebase ne sont pas publiés non plus. Générez-les pour votre propre projet Firebase :

```bash
dart pub global activate flutterfire_cli
flutterfire configure        # choisir votre projet et la plateforme android
```

Dans la console Firebase :
- créez une base **Cloud Firestore** ;
- activez **Authentication → Google**, puis copiez l'« ID client Web » dans `.env` ;
- ajoutez l'empreinte **SHA-1** de votre clé de debug Android (et de votre clé de production) dans les paramètres de l'application Android.

### 4. Générer le code et lancer

```bash
# Dans movie_data
cd ../movie_data
flutter pub get
dart run build_runner build

# Dans movies
cd ../movies
flutter pub get
dart run build_runner build
flutter run
```

## Tests

```bash
# Tests unitaires du plugin
cd movie_plugin && flutter test

# Tests de widgets de l'application
cd movies && flutter test test/widget_tests.dart

# Test d'intégration (émulateur allumé)
cd movies && flutter test integration_test/movie_tests.dart -d emulator-5554
```

## Version finale (APK)

La signature utilise un fichier `android/key.properties` et un keystore, **non publiés** dans ce dépôt.

```bash
cd movies
flutter build apk --release
# Fichier : build/app/outputs/flutter-apk/app-release.apk
```

## Adaptations par rapport au livre

Le livre a été écrit sous macOS et pour des versions plus anciennes des outils. Le projet a été réalisé sous **Ubuntu** avec les versions récentes, ce qui a demandé plusieurs adaptations : nouvelles API de Riverpod 3, AutoRoute 11, freezed 4, google_sign_in 7 et infinite_scroll_pagination 5, configuration Android de la connexion Google, plugin uniquement pour Android, et correction de plusieurs bugs du code d'origine. Le détail figure dans le rapport du projet.

## Auteur

**Angelo RANTOANDRIANTSOA** — projet de travaux pratiques de développement mobile, octobre 2026.

D'après le livre *Mastering Flutter* de Kevin Moore (BPB Publications).

## Crédits

Ce produit utilise l'API TMDB mais n'est ni approuvé ni certifié par TMDB.
Les données et images des films proviennent de [The Movie Database (TMDB)](https://www.themoviedb.org/).

## Licence

© 2026 Angelo RANTOANDRIANTSOA — **tous droits réservés**.
Ce code est publié uniquement pour consultation et évaluation ; toute copie ou réutilisation
sans autorisation écrite de l'auteur est interdite. Voir [LICENSE](LICENSE).
