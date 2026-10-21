import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'movie_plugin_method_channel.dart';

// Interface commune : chaque plateforme doit implémenter ces méthodes.
// Sinon, l'appel lève UnimplementedError (ex. : plateforme non écrite).
abstract class MoviePluginPlatform extends PlatformInterface {
  MoviePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MoviePluginPlatform _instance = MethodChannelMoviePlugin();

  /// Instance utilisée par défaut : [MethodChannelMoviePlugin].
  static MoviePluginPlatform get instance => _instance;

  static set instance(MoviePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getString(String key) async {
    throw UnimplementedError('getString has not been implemented.');
  }

  Future<bool?> setString(String key, String value) async {
    throw UnimplementedError('setString has not been implemented.');
  }

  Future<bool?> clear() async {
    throw UnimplementedError('clear has not been implemented.');
  }

  Future<bool?> containsKey(String key) async {
    throw UnimplementedError('containsKey has not been implemented.');
  }

  Future<int?> getInt(String key) async {
    throw UnimplementedError('getInt has not been implemented.');
  }

  Future<bool?> setInt(String key, int value) async {
    throw UnimplementedError('setInt has not been implemented.');
  }

  Future<bool?> getBool(String key) async {
    throw UnimplementedError('getBool has not been implemented.');
  }

  Future<bool?> setBool(String key, bool value) async {
    throw UnimplementedError('setBool has not been implemented.');
  }

  Future<double?> getDouble(String key) async {
    throw UnimplementedError('getDouble has not been implemented.');
  }

  Future<bool?> setDouble(String key, double value) async {
    throw UnimplementedError('setDouble has not been implemented.');
  }
}
