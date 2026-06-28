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

@ProviderFor(reportRecords)
final reportRecordsProvider = ReportRecordsProvider._();

final class ReportRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DrinkRecordWithItem>>,
          List<DrinkRecordWithItem>,
          FutureOr<List<DrinkRecordWithItem>>
        >
    with
        $FutureModifier<List<DrinkRecordWithItem>>,
        $FutureProvider<List<DrinkRecordWithItem>> {
  ReportRecordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRecordsHash();

  @$internal
  @override
  $FutureProviderElement<List<DrinkRecordWithItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DrinkRecordWithItem>> create(Ref ref) {
    return reportRecords(ref);
  }
}

String _$reportRecordsHash() => r'80dda421850a0f3c79bdaa0085494a75ee5f36bc';

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
    r'2f45e4689e406f42c60f0cb1b12e61d0f1c56f89';

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
    r'0e80ab0009b0caf496909671a853836cce5e8a56';

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

String _$reportTimePatternHash() => r'39b0f2832b2827777e3b2222efebf2c2d57574be';

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
    r'30398364403964158b8bc266e8498e1db381c677';

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

String _$reportSummaryHash() => r'd54e93926529d4cd01d1fc9880fcd30719bb43de';
