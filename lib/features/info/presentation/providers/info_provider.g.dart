// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(infoRepository)
final infoRepositoryProvider = InfoRepositoryProvider._();

final class InfoRepositoryProvider
    extends
        $FunctionalProvider<
          InfoRepositoryImpl,
          InfoRepositoryImpl,
          InfoRepositoryImpl
        >
    with $Provider<InfoRepositoryImpl> {
  InfoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'infoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$infoRepositoryHash();

  @$internal
  @override
  $ProviderElement<InfoRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InfoRepositoryImpl create(Ref ref) {
    return infoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InfoRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InfoRepositoryImpl>(value),
    );
  }
}

String _$infoRepositoryHash() => r'4f3d6511ad8b6c68f08501aeae2095a183f10edb';

@ProviderFor(MyInfoNotifier)
final myInfoProvider = MyInfoNotifierProvider._();

final class MyInfoNotifierProvider
    extends $AsyncNotifierProvider<MyInfoNotifier, InfoModel> {
  MyInfoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myInfoNotifierHash();

  @$internal
  @override
  MyInfoNotifier create() => MyInfoNotifier();
}

String _$myInfoNotifierHash() => r'270b8284b0ac6e2757ef0ac39c11fbce58a5f6b2';

abstract class _$MyInfoNotifier extends $AsyncNotifier<InfoModel> {
  FutureOr<InfoModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<InfoModel>, InfoModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<InfoModel>, InfoModel>,
              AsyncValue<InfoModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(InfoNotifier)
final infoProvider = InfoNotifierProvider._();

final class InfoNotifierProvider
    extends $NotifierProvider<InfoNotifier, InfoModel> {
  InfoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'infoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$infoNotifierHash();

  @$internal
  @override
  InfoNotifier create() => InfoNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InfoModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InfoModel>(value),
    );
  }
}

String _$infoNotifierHash() => r'40068340b428df260d25cd473f4f2e1038884bf1';

abstract class _$InfoNotifier extends $Notifier<InfoModel> {
  InfoModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InfoModel, InfoModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InfoModel, InfoModel>,
              InfoModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
