import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';

class GetCaffeineChartDataByDateUseCase {
  final RecordRepository repo;
  GetCaffeineChartDataByDateUseCase(this.repo);

  Future<List<double>> execute(ChartDate date) async {
    final now = DateTime.now();
    final from = _getFrom(now, date);
    final records = await repo.getRecordsByRange(from: from, to: now);

    return _buildSpots(records, date, now);
  }

  DateTime _getFrom(DateTime now, ChartDate date) {
    return switch (date) {
      ChartDate.week => now.subtract(const Duration(days: 7)),
      ChartDate.month => DateTime(now.year, now.month - 1, now.day),
      ChartDate.year => DateTime(now.year - 1, now.month, now.day),
    };
  }

  List<double> _buildSpots(
    List<DrinkRecordWithItem> records,
    ChartDate date,
    DateTime now,
  ) {
    return switch (date) {
      ChartDate.week => _buildWeekData(records, now),
      ChartDate.month => _buildMonthData(records, now),
      ChartDate.year => _buildYearData(records, now),
    };
  }

  // 주간
  List<double> _buildWeekData(List<DrinkRecordWithItem> records, DateTime now) {
    return List.generate(7, (i) {
      final day = now.subtract(Duration(days: 6 - i));
      return records
          .where(
            (r) =>
                r.record.drinkAt.year == day.year &&
                r.record.drinkAt.month == day.month &&
                r.record.drinkAt.day == day.day,
          )
          .fold(0.0, (sum, r) => sum + r.record.caffeineAmount);
    });
  }

  // 월간
  List<double> _buildMonthData(
    List<DrinkRecordWithItem> records,
    DateTime now,
  ) {
    return List.generate(30, (i) {
      final day = now.subtract(Duration(days: 29 - i));
      return records
          .where(
            (r) =>
                r.record.drinkAt.year == day.year &&
                r.record.drinkAt.month == day.month &&
                r.record.drinkAt.day == day.day,
          )
          .fold(0.0, (sum, r) => sum + r.record.caffeineAmount);
    });
  }

  // 연간
  List<double> _buildYearData(List<DrinkRecordWithItem> records, DateTime now) {
    return List.generate(12, (i) {
      final month = now.month - 11 + i;
      final year = now.year + (month <= 0 ? -1 : 0);
      final adjustedMonth = month <= 0 ? month + 12 : month;

      return records
          .where(
            (r) =>
                r.record.drinkAt.year == year &&
                r.record.drinkAt.month == adjustedMonth,
          )
          .fold(0.0, (sum, r) => sum + r.record.caffeineAmount);
    });
  }
}
