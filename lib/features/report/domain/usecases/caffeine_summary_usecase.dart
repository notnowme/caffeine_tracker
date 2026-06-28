import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';

class GetCaffeineSummaryUseCase {
  // 전체 기록을 받아 최근 7일 윈도우 내에서 날짜별 목표 초과/이하를 집계한다.
  Map<String, int> execute(
    List<DrinkRecordWithItem> records,
    InfoModel my,
    DateTime now,
  ) {
    final from = now.subtract(const Duration(days: 7));

    // 날짜별로 묶기 (drink_at BETWEEN from AND now, 양끝 포함)
    final dailyMap = <String, double>{};
    for (final record in records) {
      final date = record.record.drinkAt;
      if (date.isBefore(from) || date.isAfter(now)) continue;
      final key = '${date.year}-${date.month}-${date.day}';
      dailyMap[key] = (dailyMap[key] ?? 0) + record.record.caffeineAmount;
    }

    // 날짜별 목표 초과/이하 카운트
    final result = {'over': 0, 'down': 0};
    for (final daily in dailyMap.values) {
      if (daily > my.targetAmount) {
        result['over'] = result['over']! + 1;
      } else {
        result['down'] = result['down']! + 1;
      }
    }

    return result;
  }
}
