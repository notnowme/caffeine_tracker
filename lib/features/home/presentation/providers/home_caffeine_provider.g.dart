// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_caffeine_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentCaffeine)
final currentCaffeineProvider = CurrentCaffeineProvider._();

final class CurrentCaffeineProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  CurrentCaffeineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCaffeineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCaffeineHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return currentCaffeine(ref);
  }
}

String _$currentCaffeineHash() => r'b6f21006ae2508e023801cbbf9d61d7f6589c602';

@ProviderFor(todayDrinks)
final todayDrinksProvider = TodayDrinksProvider._();

final class TodayDrinksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DrinkRecordWithItem>>,
          List<DrinkRecordWithItem>,
          FutureOr<List<DrinkRecordWithItem>>
        >
    with
        $FutureModifier<List<DrinkRecordWithItem>>,
        $FutureProvider<List<DrinkRecordWithItem>> {
  TodayDrinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayDrinksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayDrinksHash();

  @$internal
  @override
  $FutureProviderElement<List<DrinkRecordWithItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DrinkRecordWithItem>> create(Ref ref) {
    return todayDrinks(ref);
  }
}

String _$todayDrinksHash() => r'9f4e867a1943f40a2fe360d379a37e9c7f2f85e2';

@ProviderFor(todayTotalCaffeineAmount)
final todayTotalCaffeineAmountProvider = TodayTotalCaffeineAmountProvider._();

final class TodayTotalCaffeineAmountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TodayTotalCaffeineAmountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayTotalCaffeineAmountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayTotalCaffeineAmountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return todayTotalCaffeineAmount(ref);
  }
}

String _$todayTotalCaffeineAmountHash() =>
    r'136861f4012c8b1819b7782d23204fa79dbea4b0';

@ProviderFor(sleepTime)
final sleepTimeProvider = SleepTimeProvider._();

final class SleepTimeProvider
    extends
        $FunctionalProvider<
          AsyncValue<DateTime?>,
          DateTime?,
          FutureOr<DateTime?>
        >
    with $FutureModifier<DateTime?>, $FutureProvider<DateTime?> {
  SleepTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sleepTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sleepTimeHash();

  @$internal
  @override
  $FutureProviderElement<DateTime?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DateTime?> create(Ref ref) {
    return sleepTime(ref);
  }
}

String _$sleepTimeHash() => r'3bbd24e46ff344485e4210b081ff8683242d6f79';

@ProviderFor(caffeineChartData)
final caffeineChartDataProvider = CaffeineChartDataProvider._();

final class CaffeineChartDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FlSpot>>,
          List<FlSpot>,
          FutureOr<List<FlSpot>>
        >
    with $FutureModifier<List<FlSpot>>, $FutureProvider<List<FlSpot>> {
  CaffeineChartDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'caffeineChartDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$caffeineChartDataHash();

  @$internal
  @override
  $FutureProviderElement<List<FlSpot>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FlSpot>> create(Ref ref) {
    return caffeineChartData(ref);
  }
}

String _$caffeineChartDataHash() => r'3dc0d094b7d5c30f6631bb902a8cb07a16d0ddec';
