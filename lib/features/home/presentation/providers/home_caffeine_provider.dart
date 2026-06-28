import 'package:caffeine_tracker/features/home/domain/usecases/home_chart_data.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/record_provider.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/shared/utils/caffeine_calculator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_caffeine_provider.g.dart';

@Riverpod()
Stream<double> currentCaffeine(Ref ref) async* {
  final now = DateTime.now();
  final from = now.subtract(const Duration(hours: 12));
  final records = await ref
      .watch(recordRepositoryImplProvider)
      .getRecordsByRange(from: from, to: now);
  final myInfo = ref.watch(myInfoProvider).requireValue;
  final items = records.map((e) => e.record).toList();
  yield CaffeineCalculator.getCurrentLevel(
    records: items,
    gender: myInfo.gender,
    smoking: myInfo.smoking,
  );

  await for (final _ in Stream.periodic(const Duration(seconds: 1))) {
    yield CaffeineCalculator.getCurrentLevel(
      records: items,
      gender: myInfo.gender,
      smoking: myInfo.smoking,
    );
  }
}

@Riverpod()
Future<List<DrinkRecordWithItem>> todayDrinks(Ref ref) async {
  final now = DateTime.now();
  final from = now.subtract(const Duration(hours: 24));
  return await ref
      .watch(recordRepositoryImplProvider)
      .getRecordsByRange(from: from, to: now, orderBy: OrderBy.desc);
}

@Riverpod()
Future<int> todayTotalCaffeineAmount(Ref ref) async {
  final repo = ref.read(recordRepositoryImplProvider);
  return GetTodayTotalCaffeineUseCase(repo).execute();
}

@Riverpod()
Future<DateTime?> sleepTime(Ref ref) async {
  ref.watch(currentCaffeineProvider);
  final todayRecords = ref.watch(todayDrinksProvider).value ?? [];
  final myInfo = ref.watch(myInfoProvider).requireValue;
  return CaffeineCalculator.getSleepTime(
    records: todayRecords.map((e) => e.record).toList(),
    gender: myInfo.gender,
    smoking: myInfo.smoking,
  );
}

@Riverpod()
Future<List<FlSpot>> caffeineChartData(Ref ref) async {
  final myInfo = ref.watch(myInfoProvider).requireValue;
  ref.watch(currentCaffeineProvider);

  final repo = ref.read(recordRepositoryImplProvider);
  return GetCaffeineChartDataUseCase(
    repo,
  ).execute(gender: myInfo.gender, smoking: myInfo.smoking);
}
