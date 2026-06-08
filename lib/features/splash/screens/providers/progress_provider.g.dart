// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(progress)
final progressProvider = ProgressProvider._();

final class ProgressProvider
    extends
        $FunctionalProvider<AsyncValue<Progress>, Progress, Stream<Progress>>
    with $FutureModifier<Progress>, $StreamProvider<Progress> {
  ProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressHash();

  @$internal
  @override
  $StreamProviderElement<Progress> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Progress> create(Ref ref) {
    return progress(ref);
  }
}

String _$progressHash() => r'0b8e310c6b202f7eafbe17445dfa479f93591f54';
