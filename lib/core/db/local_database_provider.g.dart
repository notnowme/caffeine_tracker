// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localDatabase)
final localDatabaseProvider = LocalDatabaseProvider._();

final class LocalDatabaseProvider
    extends $FunctionalProvider<LocalDataBase, LocalDataBase, LocalDataBase>
    with $Provider<LocalDataBase> {
  LocalDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDatabaseHash();

  @$internal
  @override
  $ProviderElement<LocalDataBase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalDataBase create(Ref ref) {
    return localDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDataBase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDataBase>(value),
    );
  }
}

String _$localDatabaseHash() => r'8b92877b00bae695278c94afd21103aa3e1f1201';
