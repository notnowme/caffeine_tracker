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
    extends $FunctionalProvider<InfoRepository, InfoRepository, InfoRepository>
    with $Provider<InfoRepository> {
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
  $ProviderElement<InfoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InfoRepository create(Ref ref) {
    return infoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InfoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InfoRepository>(value),
    );
  }
}

String _$infoRepositoryHash() => r'b95f3a865879f3295a0b92253214fdcdf4cf2506';

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

String _$myInfoNotifierHash() => r'e94c3efc12288ceb2324a97a6015b02c9bb69ce1';

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
