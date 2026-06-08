// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomItemNotifer)
final customItemNotiferProvider = CustomItemNotiferProvider._();

final class CustomItemNotiferProvider
    extends $NotifierProvider<CustomItemNotifer, CaffeineItemModel> {
  CustomItemNotiferProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customItemNotiferProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customItemNotiferHash();

  @$internal
  @override
  CustomItemNotifer create() => CustomItemNotifer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CaffeineItemModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CaffeineItemModel>(value),
    );
  }
}

String _$customItemNotiferHash() => r'9174cd6e0d3ba0828ae08895a1dbbb3033a7429f';

abstract class _$CustomItemNotifer extends $Notifier<CaffeineItemModel> {
  CaffeineItemModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CaffeineItemModel, CaffeineItemModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CaffeineItemModel, CaffeineItemModel>,
              CaffeineItemModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
