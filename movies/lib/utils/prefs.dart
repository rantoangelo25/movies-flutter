import 'package:movie_plugin/movie_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Petite classe qui simplifie l'enregistrement de réglages simples.
// Chapitre 17 : sur Android, elle utilise notre propre plugin MoviePlugin.
// Ajout : notre plugin n'existe que pour Android ; sur les autres
// plateformes (Linux desktop), on garde shared_preferences.
class Prefs {
  final MoviePlugin? preferences;
  final SharedPreferences? sharedPreferences;

  Prefs.plugin(MoviePlugin this.preferences) : sharedPreferences = null;

  Prefs.sharedPreferences(SharedPreferences this.sharedPreferences)
      : preferences = null;

  // Toutes les méthodes renvoient maintenant un Future (appel natif)
  Future setString(String key, String value) async {
    if (preferences != null) {
      return preferences!.setString(key, value);
    }
    return sharedPreferences!.setString(key, value);
  }

  Future<String?> getString(String key) async {
    if (preferences != null) {
      return preferences!.getString(key);
    }
    return sharedPreferences!.getString(key);
  }

  Future setInt(String key, int value) async {
    if (preferences != null) {
      return preferences!.setInt(key, value);
    }
    return sharedPreferences!.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    if (preferences != null) {
      return preferences!.getInt(key);
    }
    return sharedPreferences!.getInt(key);
  }

  Future setBool(String key, bool value) async {
    if (preferences != null) {
      return preferences!.setBool(key, value);
    }
    return sharedPreferences!.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    if (preferences != null) {
      return preferences!.getBool(key);
    }
    return sharedPreferences!.getBool(key);
  }

  Future setDouble(String key, double value) async {
    if (preferences != null) {
      return preferences!.setDouble(key, value);
    }
    return sharedPreferences!.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    if (preferences != null) {
      return preferences!.getDouble(key);
    }
    return sharedPreferences!.getDouble(key);
  }
}
