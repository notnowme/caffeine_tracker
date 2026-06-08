import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';

class GetCaffeineChangePercentUseCase {
  final RecordRepository repo;
  GetCaffeineChangePercentUseCase(this.repo);

  Future<double> execute(ChartDate period) async {
    final now = DateTime.now();

    // 이번 기간
    final currentFrom = _getFrom(now, period);
    final currentRecords = await repo.getRecordsByRange(
      from: currentFrom,
      to: now,
    );

    // 지난 기간
    final previousTo = currentFrom;
    final previousFrom = _getFrom(currentFrom, period);
    final previousRecords = await repo.getRecordsByRange(
      from: previousFrom,
      to: previousTo,
    );

    final current = currentRecords.fold(
      0.0,
      (sum, r) => sum + r.record.caffeineAmount,
    );
    final previous = previousRecords.fold(
      0.0,
      (sum, r) => sum + r.record.caffeineAmount,
    );

    if (previous == 0) return 0;
    return (current - previous) / previous * 100;
  }

  DateTime _getFrom(DateTime now, ChartDate period) {
    return switch (period) {
      ChartDate.week => now.subtract(const Duration(days: 7)),
      ChartDate.month => DateTime(now.year, now.month - 1, now.day),
      ChartDate.year => DateTime(now.year - 1, now.month, now.day),
    };
  }
}
