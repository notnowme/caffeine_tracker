// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ErrorNotifier)
final errorProvider = ErrorNotifierProvider._();

final class ErrorNotifierProvider
    extends $NotifierProvider<ErrorNotifier, ErrorModel?> {
  ErrorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorNotifierHash();

  @$internal
  @override
  ErrorNotifier create() => ErrorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorModel?>(value),
    );
  }
}

String _$errorNotifierHash() => r'c15bddac7f2b2c494f8940500869c84ac71f87f9';

abstract class _$ErrorNotifier extends $Notifier<ErrorModel?> {
  ErrorModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ErrorModel?, ErrorModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ErrorModel?, ErrorModel?>,
              ErrorModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
