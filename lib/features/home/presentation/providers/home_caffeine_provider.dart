import 'package:caffeine_tracker/features/home/domain/usecases/home_chart_data.dart';
import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/domain/repositories/record_repository.dart';
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

  // 체내 카페인은 반감기 단위로 천천히 감쇠하므로 정수 mg 표시·시간 단위 차트에는
  // 분 단위 갱신으로 충분하다. 매초 갱신 시 파생 provider(차트·수면시간)가 매초
  // DB 재조회·재계산되는 cascade를 피하기 위해 60초 주기로 둔다.
  await for (final _ in Stream.periodic(const Duration(seconds: 60))) {
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
