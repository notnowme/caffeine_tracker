// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caffeine_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(caffeineItemRepository)
final caffeineItemRepositoryProvider = CaffeineItemRepositoryProvider._();

final class CaffeineItemRepositoryProvider
    extends
        $FunctionalProvider<
          CaffeineItemRepository,
          CaffeineItemRepository,
          CaffeineItemRepository
        >
    with $Provider<CaffeineItemRepository> {
  CaffeineItemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'caffeineItemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$caffeineItemRepositoryHash();

  @$internal
  @override
  $ProviderElement<CaffeineItemRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CaffeineItemRepository create(Ref ref) {
    return caffeineItemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CaffeineItemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CaffeineItemRepository>(value),
    );
  }
}

String _$caffeineItemRepositoryHash() =>
    r'd7efbad991b800b570186963481d8429a791e8ce';

@ProviderFor(allCaffeineItems)
final allCaffeineItemsProvider = AllCaffeineItemsProvider._();

final class AllCaffeineItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CaffeineItemModel>>,
          List<CaffeineItemModel>,
          FutureOr<List<CaffeineItemModel>>
        >
    with
        $FutureModifier<List<CaffeineItemModel>>,
        $FutureProvider<List<CaffeineItemModel>> {
  AllCaffeineItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allCaffeineItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allCaffeineItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<CaffeineItemModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CaffeineItemModel>> create(Ref ref) {
    return allCaffeineItems(ref);
  }
}

String _$allCaffeineItemsHash() => r'af2fabca29ff7522a445f6d85b0ce61cd301bc1f';

@ProviderFor(SearchCaffeineItemsNotifier)
final searchCaffeineItemsProvider = SearchCaffeineItemsNotifierProvider._();

final class SearchCaffeineItemsNotifierProvider
    extends
        $AsyncNotifierProvider<
          SearchCaffeineItemsNotifier,
          List<CaffeineItemModel>
        > {
  SearchCaffeineItemsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchCaffeineItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchCaffeineItemsNotifierHash();

  @$internal
  @override
  SearchCaffeineItemsNotifier create() => SearchCaffeineItemsNotifier();
}

String _$searchCaffeineItemsNotifierHash() =>
    r'9a534860ceee8c112745aebbbbd8c2b552aae9ce';

abstract class _$SearchCaffeineItemsNotifier
    extends $AsyncNotifier<List<CaffeineItemModel>> {
  FutureOr<List<CaffeineItemModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<CaffeineItemModel>>,
              List<CaffeineItemModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CaffeineItemModel>>,
                List<CaffeineItemModel>
              >,
              AsyncValue<List<CaffeineItemModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
