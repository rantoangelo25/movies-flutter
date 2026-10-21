// Tests unitaires du plugin movie_plugin.
// Ajout : on utilise flutter_test (déjà présent dans le projet) au lieu
// d'ajouter le package "test", qui entre souvent en conflit de versions
// avec flutter_test. Les fonctions test, group, expect sont les mêmes.
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_plugin/movie_plugin.dart';
import 'package:movie_plugin/movie_plugin_method_channel.dart';
import 'package:movie_plugin/movie_plugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// Fausse plateforme (mock) : au lieu d'appeler le code Kotlin, elle range
// les valeurs dans une simple Map en mémoire.
class MockMoviePluginPlatform
    with MockPlatformInterfaceMixin
    implements MoviePluginPlatform {
  Map<String, dynamic> mockPrefs = <String, dynamic>{};

  @override
  Future<bool?> clear() {
    mockPrefs.clear();
    return Future.value(true);
  }

  @override
  Future<bool?> containsKey(String key) {
    return Future.value(mockPrefs.containsKey(key));
  }

  @override
  Future<String?> getString(String key) {
    return Future.value(mockPrefs[key] as String?);
  }

  @override
  Future<bool?> setString(String key, String value) {
    mockPrefs[key] = value;
    return Future.value(true);
  }

  @override
  Future<int?> getInt(String key) {
    return Future.value(mockPrefs[key] as int?);
  }

  @override
  Future<bool?> setInt(String key, int value) {
    mockPrefs[key] = value;
    return Future.value(true);
  }

  @override
  Future<bool?> getBool(String key) {
    return Future.value(mockPrefs[key] as bool?);
  }

  @override
  Future<bool?> setBool(String key, bool value) {
    mockPrefs[key] = value;
    return Future.value(true);
  }

  @override
  Future<double?> getDouble(String key) {
    return Future.value(mockPrefs[key] as double?);
  }

  @override
  Future<bool?> setDouble(String key, double value) {
    mockPrefs[key] = value;
    return Future.value(true);
  }
}

void main() {
  // Plateforme d'origine, mémorisée avant que setUp ne la remplace
  final MoviePluginPlatform initialPlatform = MoviePluginPlatform.instance;
  late MoviePlugin moviePlugin;
  late MockMoviePluginPlatform fakePlatform;

  // setUp est exécuté avant CHAQUE test : chaque test repart d'une Map vide.
  // (Le livre écrit une fonction setup() appelée au début de chaque test.)
  setUp(() {
    moviePlugin = MoviePlugin();
    fakePlatform = MockMoviePluginPlatform();
    MoviePluginPlatform.instance = fakePlatform;
  });

  // Par défaut, le plugin passe bien par le MethodChannel
  test('La plateforme par défaut est MethodChannelMoviePlugin', () {
    expect(initialPlatform, isA<MethodChannelMoviePlugin>());
  });

  group('Test All String methods', () {
    test('setString: Add One item', () async {
      expect(await moviePlugin.setString('Test', 'Value 1'), true);
    });

    test('setString: Add One item and then clear', () async {
      expect(await moviePlugin.setString('Test', 'Value 1'), true);
      expect(await moviePlugin.clear(), true);
      expect(await moviePlugin.containsKey('Test'), false);
    });

    test('setString: Add One item and then get the string', () async {
      expect(await moviePlugin.setString('Test', 'Value 1'), true);
      expect(await moviePlugin.getString('Test'), 'Value 1');
    });

    // Ajout : une clé inconnue renvoie null
    test('getString: unknown key returns null', () async {
      expect(await moviePlugin.getString('Unknown'), isNull);
    });
  });

  test('Test Ints', () async {
    expect(await moviePlugin.setInt('IntKey', 1), true);
    expect(await moviePlugin.getInt('IntKey'), 1);
    expect(await moviePlugin.containsKey('IntKey'), true);
    expect(await moviePlugin.clear(), true);
    expect(await moviePlugin.containsKey('IntKey'), false);
  });

  // Ajout : les tests « laissés en exercice » par le livre
  test('Test Bools', () async {
    expect(await moviePlugin.setBool('BoolKey', true), true);
    expect(await moviePlugin.getBool('BoolKey'), true);
    expect(await moviePlugin.containsKey('BoolKey'), true);
    expect(await moviePlugin.clear(), true);
    expect(await moviePlugin.containsKey('BoolKey'), false);
  });

  test('Test Doubles', () async {
    expect(await moviePlugin.setDouble('DoubleKey', 3.14), true);
    expect(await moviePlugin.getDouble('DoubleKey'), 3.14);
    expect(await moviePlugin.containsKey('DoubleKey'), true);
    expect(await moviePlugin.clear(), true);
    expect(await moviePlugin.containsKey('DoubleKey'), false);
  });
}
