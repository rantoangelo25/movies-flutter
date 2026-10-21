import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// =============================================================
//  Couleurs de l'application
// =============================================================
const screenBackground = Color(0xFF111111);
const searchBarBackground = Color(0xFF1E1E1E);
const primaryButton = Color(0xFFD9D9D9);
const posterBorder = Color(0xFFB5A9A9);
const buttonGrey = Color(0xFF504F4F);

// =============================================================
//  Styles de texte (police Roboto via Google Fonts)
// =============================================================
var roboto = GoogleFonts.roboto();

var largeTitle = roboto.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

var heading1 = roboto.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

var heading2 = roboto.copyWith(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

var body1Regular = roboto.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var body1Bold = roboto.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

var body2Regular = roboto.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var body2Bold = roboto.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

var caption = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var body3Regular = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var body3Bold = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

var verySmallText = roboto.copyWith(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

// =============================================================
//  Thème global de l'application
// =============================================================
ThemeData createTheme() {
  return ThemeData(
    // Ajout du livre (chapitre 16) : fond noir derrière tous les écrans
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3), // Couleur de base (bleu)
      primary: const Color(0xFF2196F3), // Couleur principale
      onPrimary: Colors.white, // Texte/icône sur la couleur principale
      secondary: const Color(0xFF90CAF9), // Couleur secondaire (bleu clair)
      onSecondary: Colors.black,
      surfaceContainerHighest: Colors.black,
      surface: const Color(0xFFBBDEFB), // Cartes, menus, etc.
      onSurface: Colors.black, // Texte/icône sur surface
      error: const Color(0xFFB00020), // Couleur d'erreur (rouge)
      onError: Colors.white,
      brightness: Brightness.light, // Luminosité générale
    ),
    textTheme: Typography.material2021().englishLike.copyWith(
          headlineLarge: heading1,
          headlineMedium: heading2,
          headlineSmall: body2Regular,
          titleLarge: largeTitle,
          titleMedium: heading2,
          titleSmall: body2Bold,
          bodyLarge: body1Regular,
          bodyMedium: body2Regular,
          bodySmall: body3Regular,
          labelLarge: body1Bold,
          labelMedium: body2Bold,
          labelSmall: caption,
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // Fond de la barre de titre
      foregroundColor: Colors.black, // Texte/icônes de la barre de titre
    ),
    // Thème de la NavigationBar (Material 3)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: searchBarBackground,
      labelTextStyle:
          WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
        // Onglet sélectionné en blanc, les autres en gris rosé
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: Colors.white);
        }
        return const TextStyle(color: posterBorder);
      }),
      iconTheme: WidgetStateProperty.all<IconThemeData>(
          const IconThemeData(color: Colors.white)),
      indicatorColor: posterBorder,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: searchBarBackground, // Fond de la barre du bas
      selectedItemColor: Colors.white, // Onglet sélectionné
      unselectedLabelStyle: TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      unselectedItemColor: posterBorder, // Onglets non sélectionnés
    ),
  );
}
