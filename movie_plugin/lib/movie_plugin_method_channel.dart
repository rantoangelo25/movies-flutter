import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'movie_plugin_platform_interface.dart';

// Mêmes noms que l'enum MethodCalls du code Kotlin
enum MethodCalls {
  getString('getString'),
  setString('setString'),
  clear('clear'),
  containsKey('containsKey'),
  getInt('getInt'),
  setInt('setInt'),
  getBool('getBool'),
  setBool('setBool'),
  getDouble('getDouble'),
  setDouble('setDouble');

  final String value;

  const MethodCalls(this.value);
}

/// Implémentation qui parle au code natif par un MethodChannel
class MethodChannelMoviePlugin extends MoviePluginPlatform {
  /// Canal nommé "movie_plugin", comme côté Kotlin
  @visibleForTesting
  final methodChannel = const MethodChannel('movie_plugin');

  @override
  Future<String?> getString(String key) async {
    return methodChannel
        .invokeMethod<String?>(MethodCalls.getString.value, {'key': key});
  }

  // Ajout : les méthodes d'écriture renvoient le résultat (bool) du code
  // natif, au lieu de void dans le livre
  @override
  Future<bool?> setString(String key, String value) async {
    return methodChannel.invokeMethod<bool>(
        MethodCalls.setString.value, {'key': key, 'value': value});
  }

  @override
  Future<bool?> clear() async {
    return methodChannel.invokeMethod<bool>(MethodCalls.clear.value);
  }

  @override
  Future<bool?> containsKey(String key) async {
    return methodChannel
        .invokeMethod<bool>(MethodCalls.containsKey.value, {'key': key});
  }

  @override
  Future<int?> getInt(String key) async {
    return methodChannel
        .invokeMethod<int?>(MethodCalls.getInt.value, {'key': key});
  }

  @override
  Future<bool?> setInt(String key, int value) async {
    return methodChannel.invokeMethod<bool>(
        MethodCalls.setInt.value, {'key': key, 'value': value});
  }

  @override
  Future<bool?> getBool(String key) async {
    return methodChannel
        .invokeMethod<bool?>(MethodCalls.getBool.value, {'key': key});
  }

  @override
  Future<bool?> setBool(String key, bool value) async {
    return methodChannel.invokeMethod<bool>(
        MethodCalls.setBool.value, {'key': key, 'value': value});
  }

  @override
  Future<double?> getDouble(String key) async {
    return methodChannel
        .invokeMethod<double?>(MethodCalls.getDouble.value, {'key': key});
  }

  @override
  Future<bool?> setDouble(String key, double value) async {
    return methodChannel.invokeMethod<bool>(
        MethodCalls.setDouble.value, {'key': key, 'value': value});
  }
}
