// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_tab_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TabPageNotifier)
final tabPageProvider = TabPageNotifierProvider._();

final class TabPageNotifierProvider
    extends $NotifierProvider<TabPageNotifier, int> {
  TabPageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabPageNotifierHash();

  @$internal
  @override
  TabPageNotifier create() => TabPageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$tabPageNotifierHash() => r'8decd6ef1e86c49416f307a864c1ae841c358494';

abstract class _$TabPageNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
