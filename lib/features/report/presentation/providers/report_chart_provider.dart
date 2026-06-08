import 'package:caffeine_tracker/features/info/presentation/providers/info_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/record_provider.dart';
import 'package:caffeine_tracker/features/report/data/models/report_hits_model.dart';
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

@Riverpod()
Future<double> reportChangeCaffeinePercent(Ref ref) async {
  final date = ref.watch(chartDateProvider);
  final repo = ref.read(recordRepositoryImplProvider);
  return await GetCaffeineChangePercentUseCase(repo).execute(date);
}

@Riverpod()
Future<List<double>> reportCaffeineData(Ref ref) async {
  final date = ref.watch(chartDateProvider);
  final repo = ref.read(recordRepositoryImplProvider);
  return await GetCaffeineChartDataByDateUseCase(repo).execute(date);
}

@Riverpod()
Future<List<double>> reportTimePattern(Ref ref) async {
  final repo = ref.read(recordRepositoryImplProvider);
  return await GetCaffeineTimePatternUseCase(repo).execute();
}

@Riverpod()
Future<List<DrinkDescModel>> reportCaffeineDesc(Ref ref) async {
  final repo = ref.read(recordRepositoryImplProvider);
  return await GetCaffeineAddDescUseCase(repo).execute();
}

@Riverpod()
Future<Map<String, int>> reportSummary(Ref ref) async {
  final repo = ref.read(recordRepositoryImplProvider);
  final my = ref.watch(myInfoProvider).value!;
  return await GetCaffeineSummaryUseCase(repo).execute(my);
}
