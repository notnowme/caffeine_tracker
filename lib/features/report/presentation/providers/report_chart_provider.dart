import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/record_provider.dart';
import 'package:caffeine_tracker/features/report/data/models/report_hits_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_change_usecase.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_chart_usecase.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_report_desc_usecase.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_summary_usecase.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_time_pattern_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_chart_provider.g.dart';

enum ChartDate {
  week('이번 주'),
  month('이번 달'),
  year('연간');

  final String label;
  const ChartDate(this.label);
}

@Riverpod()
class ChartDateNotifier extends _$ChartDateNotifier {
  @override
  ChartDate build() {
    return ChartDate.week;
  }

  void change(ChartDate date) => state = date;
}

// 리포트 화면의 모든 통계가 공유하는 베이스 provider. 전체 기록(item 포함)을
// 한 번만 조회하고, 각 통계 provider는 이를 watch해 메모리에서 가공한다.
// (기존: 통계마다 range 조회 5~6회 + 각 N+1 → 이제 1회 조회로 dedup)
@Riverpod()
Future<List<DrinkRecordWithItem>> reportRecords(Ref ref) async {
  final repo = ref.read(recordRepositoryImplProvider);
  return repo.getRecordsWithItem();
}

@Riverpod()
Future<double> reportChangeCaffeinePercent(Ref ref) async {
  final date = ref.watch(chartDateProvider);
  final records = await ref.watch(reportRecordsProvider.future);
  return GetCaffeineChangePercentUseCase().execute(records, date, DateTime.now());
}

@Riverpod()
Future<List<double>> reportCaffeineData(Ref ref) async {
  final date = ref.watch(chartDateProvider);
  final records = await ref.watch(reportRecordsProvider.future);
  return GetCaffeineChartDataByDateUseCase().execute(records, date, DateTime.now());
}

@Riverpod()
Future<List<double>> reportTimePattern(Ref ref) async {
  final records = await ref.watch(reportRecordsProvider.future);
  return GetCaffeineTimePatternUseCase().execute(records, DateTime.now());
}

@Riverpod()
Future<List<DrinkDescModel>> reportCaffeineDesc(Ref ref) async {
  final records = await ref.watch(reportRecordsProvider.future);
  return GetCaffeineAddDescUseCase().execute(records);
}

@Riverpod()
Future<Map<String, int>> reportSummary(Ref ref) async {
  final records = await ref.watch(reportRecordsProvider.future);
  final my = ref.watch(myInfoProvider).value!;
  return GetCaffeineSummaryUseCase().execute(records, my, DateTime.now());
}
