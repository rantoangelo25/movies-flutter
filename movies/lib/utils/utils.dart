import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_data/movie_data.dart';

Widget addVerticalSpace(double amount) {
  return SizedBox(height: amount);
}

Widget addHorizontalSpace(double amount) {
  return SizedBox(width: amount);
}

enum Sorting {
  aToz(name: 'A-Z'),
  zToa(name: 'Z-A'),
  rating(name: 'Rating'),
  year(name: 'Year');

  const Sorting({required this.name});
  final String name;
}

String youtubeUrlFromId(String videoId) {
  return 'https://www.youtube.com/watch?v=$videoId';
}

// Renvoie l'identifiant du film touché
typedef OnMovieTap = void Function(int movieId);

// Renvoie la vidéo touchée
typedef OnMovieVideoTap = void Function(MovieVideo video);

// Renvoie le favori touché
typedef OnFavoriteResultsTap = void Function(DBFavorite favorite);

// Renvoie le film (MovieResults) touché
typedef OnMovieResultsTap = void Function(MovieResults movie);

// Widget vide réutilisable
const Widget emptyWidget = SizedBox.shrink();

// Tailles d'images TMDB
enum ImageSize { small, large }

// Assemble l'adresse : base + taille + fichier
String imageUrl(String baseUrl, String size, String file) =>
    '$baseUrl$size$file';

// Adresse d'une image à partir de la configuration TMDB.
// Correction : le livre utilise baseUrl (http://), bloqué par Android ;
// on utilise secureBaseUrl (https://).
String? getSizedImageUrl(
    ImageSize size, MovieConfiguration configuration, String? file) {
  if (file == null) {
    return null;
  }
  switch (size) {
    case ImageSize.small:
      return imageUrl(configuration.images.secureBaseUrl,
          configuration.images.posterSizes[1], file);
    case ImageSize.large:
      return imageUrl(configuration.images.secureBaseUrl,
          configuration.images.posterSizes[5], file);
  }
}

// Grande image de fond d'un film
String? getMovieDetailsImagePath(
    MovieDetails details, MovieConfiguration configuration) {
  return getSizedImageUrl(
      ImageSize.large, configuration, details.backdropPath);
}

// Format pour afficher uniquement l'année
final yearFormat = DateFormat('yyyy');

// Miniature d'une vidéo YouTube
String youtubeImageFromId(String videoId) {
  return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
}

// ---------- Plateformes ----------
// kIsWeb (Flutter) indique une application web ; Platform (dart:io)
// n'est pas utilisable sur le web, d'où les vérifications de kIsWeb.
bool isWeb() {
  return kIsWeb;
}

bool isDesktop() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}

bool isMobile() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isIOS || Platform.isAndroid;
}

bool isMac() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isMacOS;
}

bool isWindows() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isWindows;
}

// Firebase n'est configuré que pour Android dans ce projet
// (il n'existe pas de version de Firebase pour Linux desktop).
// Sur les autres plateformes, l'application garde la base drift.
bool firebaseSupported() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isAndroid;
}

// Chapitre 17 : notre plugin MoviePlugin n'est écrit que pour Android
bool isAndroid() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isAndroid;
}
