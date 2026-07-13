import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/entities/chart_date.dart';

class GetCaffeineChartDataByDateUseCase {
  // 전체 기록을 받아 메모리에서 기간별 버킷으로 집계한다(공유 provider가 1회 조회).
  // 버킷 매칭이 기간 윈도우를 내포하므로 별도 범위 필터는 불필요하다.
  List<double> execute(
    List<DrinkRecordWithItem> records,
    ChartDate date,
    DateTime now,
  ) {
    return _buildSpots(records, date, now);
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
