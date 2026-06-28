import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';

class GetCaffeineChangePercentUseCase {
  // 전체 기록을 받아 메모리에서 이번/지난 기간을 윈도우링한다(공유 provider가 1회 조회).
  double execute(
    List<DrinkRecordWithItem> records,
    ChartDate period,
    DateTime now,
  ) {
    // 이번 기간 [currentFrom, now], 지난 기간 [previousFrom, currentFrom]
    final currentFrom = _getFrom(now, period);
    final previousFrom = _getFrom(currentFrom, period);

    final current = _sumInRange(records, currentFrom, now);
    final previous = _sumInRange(records, previousFrom, currentFrom);

    if (previous == 0) return 0;
    return (current - previous) / previous * 100;
  }

  // drink_at BETWEEN from AND to (양끝 포함) — 기존 SQL 조회와 동일 의미.
  double _sumInRange(
    List<DrinkRecordWithItem> records,
    DateTime from,
    DateTime to,
  ) {
    return records
        .where(
          (r) =>
              !r.record.drinkAt.isBefore(from) &&
              !r.record.drinkAt.isAfter(to),
        )
        .fold(0.0, (sum, r) => sum + r.record.caffeineAmount);
  }

  DateTime _getFrom(DateTime now, ChartDate period) {
    return switch (period) {
      ChartDate.week => now.subtract(const Duration(days: 7)),
      ChartDate.month => DateTime(now.year, now.month - 1, now.day),
      ChartDate.year => DateTime(now.year - 1, now.month, now.day),
    };
  }
}
