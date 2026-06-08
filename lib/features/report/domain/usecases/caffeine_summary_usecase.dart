import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';

class GetCaffeineSummaryUseCase {
  final RecordRepository repo;
  GetCaffeineSummaryUseCase(this.repo);

  Future<Map<String, int>> execute(InfoModel my) async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(days: 7));
    final records = await repo.getRecordsByRange(from: from, to: now);

    // 날짜별로 묶기
    final dailyMap = <String, double>{};
    for (final record in records) {
      final date = record.record.drinkAt;
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
