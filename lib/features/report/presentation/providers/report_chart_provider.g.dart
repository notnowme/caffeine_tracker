// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_chart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChartDateNotifier)
final chartDateProvider = ChartDateNotifierProvider._();

final class ChartDateNotifierProvider
    extends $NotifierProvider<ChartDateNotifier, ChartDate> {
  ChartDateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartDateNotifierHash();

  @$internal
  @override
  ChartDateNotifier create() => ChartDateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChartDate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChartDate>(value),
    );
  }
}

String _$chartDateNotifierHash() => r'b6288c20a0bbf075f540bf2fec83d5553cb278e4';

abstract class _$ChartDateNotifier extends $Notifier<ChartDate> {
  ChartDate build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ChartDate, ChartDate>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChartDate, ChartDate>,
              ChartDate,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(reportChangeCaffeinePercent)
final reportChangeCaffeinePercentProvider =
    ReportChangeCaffeinePercentProvider._();

final class ReportChangeCaffeinePercentProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  ReportChangeCaffeinePercentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportChangeCaffeinePercentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportChangeCaffeinePercentHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return reportChangeCaffeinePercent(ref);
  }
}

String _$reportChangeCaffeinePercentHash() =>
    r'cf710bccd07df440111912db2fa9fce917da2ed6';

@ProviderFor(reportCaffeineData)
final reportCaffeineDataProvider = ReportCaffeineDataProvider._();

final class ReportCaffeineDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<double>>,
          List<double>,
          FutureOr<List<double>>
        >
    with $FutureModifier<List<double>>, $FutureProvider<List<double>> {
  ReportCaffeineDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportCaffeineDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportCaffeineDataHash();

  @$internal
  @override
  $FutureProviderElement<List<double>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<double>> create(Ref ref) {
    return reportCaffeineData(ref);
  }
}

String _$reportCaffeineDataHash() =>
    r'2be70a79fc1c66cad2cf3b0719a8ab6ea8b1c436';

@ProviderFor(reportTimePattern)
final reportTimePatternProvider = ReportTimePatternProvider._();

final class ReportTimePatternProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<double>>,
          List<double>,
          FutureOr<List<double>>
        >
    with $FutureModifier<List<double>>, $FutureProvider<List<double>> {
  ReportTimePatternProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportTimePatternProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportTimePatternHash();

  @$internal
  @override
  $FutureProviderElement<List<double>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<double>> create(Ref ref) {
    return reportTimePattern(ref);
  }
}

String _$reportTimePatternHash() => r'd11d1ccdcd85feaab84da3cb0710e2fbc238c734';

@ProviderFor(reportCaffeineDesc)
final reportCaffeineDescProvider = ReportCaffeineDescProvider._();

final class ReportCaffeineDescProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DrinkDescModel>>,
          List<DrinkDescModel>,
          FutureOr<List<DrinkDescModel>>
        >
    with
        $FutureModifier<List<DrinkDescModel>>,
        $FutureProvider<List<DrinkDescModel>> {
  ReportCaffeineDescProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportCaffeineDescProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportCaffeineDescHash();

  @$internal
  @override
  $FutureProviderElement<List<DrinkDescModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DrinkDescModel>> create(Ref ref) {
    return reportCaffeineDesc(ref);
  }
}

String _$reportCaffeineDescHash() =>
    r'310195788568d4bb208ece2b45188e9c55147b57';

@ProviderFor(reportSummary)
final reportSummaryProvider = ReportSummaryProvider._();

final class ReportSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, int>>,
          Map<String, int>,
          FutureOr<Map<String, int>>
        >
    with $FutureModifier<Map<String, int>>, $FutureProvider<Map<String, int>> {
  ReportSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportSummaryHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, int>> create(Ref ref) {
    return reportSummary(ref);
  }
}

String _$reportSummaryHash() => r'8ecd2753898d4a96670a9d61fceff121b0961f78';
