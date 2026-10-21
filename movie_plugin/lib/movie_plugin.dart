import 'movie_plugin_platform_interface.dart';

/// Point d'entrée du plugin : ce sont ces méthodes que l'application appelle
class MoviePlugin {
  Future<String?> getString(String key) {
    return MoviePluginPlatform.instance.getString(key);
  }

  Future<bool?> setString(String key, String value) {
    return MoviePluginPlatform.instance.setString(key, value);
  }

  Future<bool?> clear() {
    return MoviePluginPlatform.instance.clear();
  }

  Future<bool?> containsKey(String key) {
    return MoviePluginPlatform.instance.containsKey(key);
  }

  Future<int?> getInt(String key) {
    return MoviePluginPlatform.instance.getInt(key);
  }

  Future<bool?> setInt(String key, int value) {
    return MoviePluginPlatform.instance.setInt(key, value);
  }

  Future<double?> getDouble(String key) {
    return MoviePluginPlatform.instance.getDouble(key);
  }

  Future<bool?> setDouble(String key, double value) {
    return MoviePluginPlatform.instance.setDouble(key, value);
  }

  Future<bool?> getBool(String key) {
    return MoviePluginPlatform.instance.getBool(key);
  }

  Future<bool?> setBool(String key, bool value) {
    return MoviePluginPlatform.instance.setBool(key, value);
  }
}
