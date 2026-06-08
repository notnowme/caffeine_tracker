// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_text_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchTextNotifier)
final searchTextProvider = SearchTextNotifierProvider._();

final class SearchTextNotifierProvider
    extends $NotifierProvider<SearchTextNotifier, String> {
  SearchTextNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchTextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchTextNotifierHash();

  @$internal
  @override
  SearchTextNotifier create() => SearchTextNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchTextNotifierHash() =>
    r'5960151b952c352dd27ce6ce12c6af56214ecd8f';

abstract class _$SearchTextNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
