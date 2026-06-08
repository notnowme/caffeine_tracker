import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';

class GetCaffeineTimePatternUseCase {
  final RecordRepository repo;
  GetCaffeineTimePatternUseCase(this.repo);

  Future<List<double>> execute() async {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month - 1, now.day);
    final records = await repo.getRecordsByRange(from: from, to: now);

    // 0~23시 24개 구간
    final pattern = List.filled(24, 0.0);

    for (final record in records) {
      final hour = record.record.drinkAt.hour;
      pattern[hour] += record.record.caffeineAmount;
    }

    return pattern;
  }
}
