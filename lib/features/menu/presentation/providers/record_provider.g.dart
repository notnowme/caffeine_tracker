// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordRepositoryImpl)
final recordRepositoryImplProvider = RecordRepositoryImplProvider._();

final class RecordRepositoryImplProvider
    extends
        $FunctionalProvider<
          RecordRepositoryImpl,
          RecordRepositoryImpl,
          RecordRepositoryImpl
        >
    with $Provider<RecordRepositoryImpl> {
  RecordRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<RecordRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecordRepositoryImpl create(Ref ref) {
    return recordRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordRepositoryImpl>(value),
    );
  }
}

String _$recordRepositoryImplHash() =>
    r'9476f0eba9f3787075dba4de720f89712b88bf48';

@ProviderFor(RecentRecordNotifier)
final recentRecordProvider = RecentRecordNotifierProvider._();

final class RecentRecordNotifierProvider
    extends
        $AsyncNotifierProvider<
          RecentRecordNotifier,
          List<DrinkRecordWithItem>
        > {
  RecentRecordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentRecordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentRecordNotifierHash();

  @$internal
  @override
  RecentRecordNotifier create() => RecentRecordNotifier();
}

String _$recentRecordNotifierHash() =>
    r'140798cdbeaf0926070af8571a79b189513b2969';

abstract class _$RecentRecordNotifier
    extends $AsyncNotifier<List<DrinkRecordWithItem>> {
  FutureOr<List<DrinkRecordWithItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DrinkRecordWithItem>>,
              List<DrinkRecordWithItem>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DrinkRecordWithItem>>,
                List<DrinkRecordWithItem>
              >,
              AsyncValue<List<DrinkRecordWithItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(RecordNotifier)
final recordProvider = RecordNotifierProvider._();

final class RecordNotifierProvider
    extends $AsyncNotifierProvider<RecordNotifier, List<DrinkRecordModel>> {
  RecordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordNotifierHash();

  @$internal
  @override
  RecordNotifier create() => RecordNotifier();
}

String _$recordNotifierHash() => r'd37ee4f56234e145c325f19fa2d78cde948e91e3';

abstract class _$RecordNotifier extends $AsyncNotifier<List<DrinkRecordModel>> {
  FutureOr<List<DrinkRecordModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<DrinkRecordModel>>, List<DrinkRecordModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DrinkRecordModel>>,
                List<DrinkRecordModel>
              >,
              AsyncValue<List<DrinkRecordModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
