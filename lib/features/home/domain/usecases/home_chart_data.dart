import 'dart:math';

import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/shared/utils/caffeine_calculator.dart';
import 'package:fl_chart/fl_chart.dart';

class GetCaffeineChartDataUseCase {
  final RecordRepository repo;
  GetCaffeineChartDataUseCase(this.repo);

  Future<List<FlSpot>> execute({
    required Gender gender,
    required bool smoking,
  }) async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(hours: 12));

    // 12시간 내 기록 조회
    final records = await repo.getRecordsByRange(from: from, to: now);

    final item = records.map((e) => e.record);

    // 1시간 간격으로 포인트 생성
    final spots = <FlSpot>[];
    for (int i = 0; i <= 12; i++) {
      final targetTime = from.add(Duration(hours: i));
      final halfLife = CaffeineCalculator.getHalfLife(
        gender: gender,
        smoking: smoking,
      );

      double level = 0.0;
      for (final record in item) {
        // targetTime 이전에 마신 것만 계산
        if (record.drinkAt.isAfter(targetTime)) continue;
        final minutesElapsed = targetTime
            .difference(record.drinkAt)
            .inMinutes
            .toDouble();

        if (minutesElapsed < 45) {
          // 45분까지 선형으로 증가
          final absorbed = record.caffeineAmount * (minutesElapsed / 45);
          level += absorbed;
        } else {
          // 45분 이후 반감기로 감소
          final hoursElapsed = (minutesElapsed - 45) / 60.0;
          level += record.caffeineAmount * pow(0.5, hoursElapsed / halfLife);
        }
      }
      spots.add(FlSpot(i.toDouble(), level));
    }
    return spots;
  }
}

class GetTodayTotalCaffeineUseCase {
  final RecordRepository repo;
  GetTodayTotalCaffeineUseCase(this.repo);

  Future<int> execute() async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(hours: 24));
    final records = await repo.getRecordsByRange(from: from, to: now);

    return records
        .map((e) => e.record)
        .fold(0.0, (sum, record) => sum + record.caffeineAmount)
        .toInt();
  }
}
