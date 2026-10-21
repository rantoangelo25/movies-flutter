// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPrefs)
final sharedPrefsProvider = SharedPrefsProvider._();

final class SharedPrefsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  SharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefsHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPrefs(ref);
  }
}

String _$sharedPrefsHash() => r'eba279b4efb2d4ef41070faedd17991e4ffd9384';

@ProviderFor(moviePlugin)
final moviePluginProvider = MoviePluginProvider._();

final class MoviePluginProvider
    extends $FunctionalProvider<MoviePlugin, MoviePlugin, MoviePlugin>
    with $Provider<MoviePlugin> {
  MoviePluginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviePluginProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviePluginHash();

  @$internal
  @override
  $ProviderElement<MoviePlugin> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoviePlugin create(Ref ref) {
    return moviePlugin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviePlugin value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviePlugin>(value),
    );
  }
}

String _$moviePluginHash() => r'026aac7e264d566451cb85350200a3908960e760';

@ProviderFor(prefs)
final prefsProvider = PrefsProvider._();

final class PrefsProvider
    extends $FunctionalProvider<AsyncValue<Prefs>, Prefs, FutureOr<Prefs>>
    with $FutureModifier<Prefs>, $FutureProvider<Prefs> {
  PrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prefsHash();

  @$internal
  @override
  $FutureProviderElement<Prefs> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Prefs> create(Ref ref) {
    return prefs(ref);
  }
}

String _$prefsHash() => r'3cfb7cd03d62f559852537903d79f7d604bf85c6';

@ProviderFor(movieAPIService)
final movieAPIServiceProvider = MovieAPIServiceProvider._();

final class MovieAPIServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieAPIService>,
          MovieAPIService,
          FutureOr<MovieAPIService>
        >
    with $FutureModifier<MovieAPIService>, $FutureProvider<MovieAPIService> {
  MovieAPIServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieAPIServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieAPIServiceHash();

  @$internal
  @override
  $FutureProviderElement<MovieAPIService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieAPIService> create(Ref ref) {
    return movieAPIService(ref);
  }
}

String _$movieAPIServiceHash() => r'53ba973661160c85664f75ffb74ddec61ad30526';

@ProviderFor(networkMovieSource)
final networkMovieSourceProvider = NetworkMovieSourceProvider._();

final class NetworkMovieSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieSource>,
          MovieSource,
          FutureOr<MovieSource>
        >
    with $FutureModifier<MovieSource>, $FutureProvider<MovieSource> {
  NetworkMovieSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkMovieSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkMovieSourceHash();

  @$internal
  @override
  $FutureProviderElement<MovieSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieSource> create(Ref ref) {
    return networkMovieSource(ref);
  }
}

String _$networkMovieSourceHash() =>
    r'a28790b19ad390bd72ec58cc6538382075476326';

@ProviderFor(movieRepository)
final movieRepositoryProvider = MovieRepositoryProvider._();

final class MovieRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieSource>,
          MovieSource,
          FutureOr<MovieSource>
        >
    with $FutureModifier<MovieSource>, $FutureProvider<MovieSource> {
  MovieRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<MovieSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieSource> create(Ref ref) {
    return movieRepository(ref);
  }
}

String _$movieRepositoryHash() => r'bf6b6b698994d688cc085cc4b773aabe4bdaf02f';

@ProviderFor(movieViewModel)
final movieViewModelProvider = MovieViewModelProvider._();

final class MovieViewModelProvider
    extends
        $FunctionalProvider<
          AsyncValue<MovieViewModel>,
          MovieViewModel,
          FutureOr<MovieViewModel>
        >
    with $FutureModifier<MovieViewModel>, $FutureProvider<MovieViewModel> {
  MovieViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieViewModelHash();

  @$internal
  @override
  $FutureProviderElement<MovieViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MovieViewModel> create(Ref ref) {
    return movieViewModel(ref);
  }
}

String _$movieViewModelHash() => r'b1fafc979b78ce30e84fcd9d67fb1e42d3584253';

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

final class AppRouterProvider
    extends $FunctionalProvider<AppRouter, AppRouter, AppRouter>
    with $Provider<AppRouter> {
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<AppRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRouter>(value),
    );
  }
}

String _$appRouterHash() => r'fc1228daa214cc1ad475cfdeafc6db36a6a237b5';

@ProviderFor(driftDatabase)
final driftDatabaseProvider = DriftDatabaseProvider._();

final class DriftDatabaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<IDatabase>,
          IDatabase,
          FutureOr<IDatabase>
        >
    with $FutureModifier<IDatabase>, $FutureProvider<IDatabase> {
  DriftDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driftDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driftDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<IDatabase> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<IDatabase> create(Ref ref) {
    return driftDatabase(ref);
  }
}

String _$driftDatabaseHash() => r'7c0b72c8f00b7b8b3c2d10f5c3c013199c35589d';

@ProviderFor(firebase)
final firebaseProvider = FirebaseProvider._();

final class FirebaseProvider
    extends $FunctionalProvider<IDatabase, IDatabase, IDatabase>
    with $Provider<IDatabase> {
  FirebaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseHash();

  @$internal
  @override
  $ProviderElement<IDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IDatabase create(Ref ref) {
    return firebase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDatabase>(value),
    );
  }
}

String _$firebaseHash() => r'28c282c44598420f42f6a080401076b8d0d6867e';

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<IDatabase>,
          IDatabase,
          FutureOr<IDatabase>
        >
    with $FutureModifier<IDatabase>, $FutureProvider<IDatabase> {
  DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $FutureProviderElement<IDatabase> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<IDatabase> create(Ref ref) {
    return database(ref);
  }
}

String _$databaseHash() => r'4e62bac1b32477bcc74d674a639df663d9f99357';

@ProviderFor(authService)
final authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $FunctionalProvider<AuthService, AuthService, AuthService>
    with $Provider<AuthService> {
  AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<AuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthService>(value),
    );
  }
}

String _$authServiceHash() => r'5c4396ad3506c41c8cea38eece801ed2620d4e46';

@ProviderFor(authState)
final authStateProvider = AuthStateProvider._();

final class AuthStateProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
  AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return authState(ref);
  }
}

String _$authStateHash() => r'11dc01c571f7bbe6af33304698ab9bd3289c9e2b';

@ProviderFor(menuManager)
final menuManagerProvider = MenuManagerProvider._();

final class MenuManagerProvider
    extends $FunctionalProvider<MenuManager, MenuManager, MenuManager>
    with $Provider<MenuManager> {
  MenuManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuManagerHash();

  @$internal
  @override
  $ProviderElement<MenuManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MenuManager create(Ref ref) {
    return menuManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuManager>(value),
    );
  }
}

String _$menuManagerHash() => r'a9e8709df311fbd3964678108faded0081f21705';

@ProviderFor(eventBus)
final eventBusProvider = EventBusProvider._();

final class EventBusProvider
    extends $FunctionalProvider<EventBus, EventBus, EventBus>
    with $Provider<EventBus> {
  EventBusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventBusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventBusHash();

  @$internal
  @override
  $ProviderElement<EventBus> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EventBus create(Ref ref) {
    return eventBus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventBus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventBus>(value),
    );
  }
}

String _$eventBusHash() => r'9f379482073cc2c43036ff2e369cba327a87d7bb';
