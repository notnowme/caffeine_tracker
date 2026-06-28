import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';

class GetCaffeineTimePatternUseCase {
  // 전체 기록을 받아 최근 1개월 윈도우 내 기록을 시간대별로 집계한다.
  List<double> execute(List<DrinkRecordWithItem> records, DateTime now) {
    final from = DateTime(now.year, now.month - 1, now.day);

    // 0~23시 24개 구간
    final pattern = List.filled(24, 0.0);

    for (final record in records) {
      final at = record.record.drinkAt;
      // drink_at BETWEEN from AND now (양끝 포함)
      if (at.isBefore(from) || at.isAfter(now)) continue;
      pattern[at.hour] += record.record.caffeineAmount;
    }

    return pattern;
  }
}
