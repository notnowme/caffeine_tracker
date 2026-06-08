import 'dart:math';

import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';

class CaffeineCalculator {
  /// 반감기 계산 (시간)
  static double getHalfLife({required Gender gender, required bool smoking}) {
    double halfLife = 5.0; // 기본 5시간

    if (smoking) {
      halfLife *= 0.5; // 흡연자는 절반
    }

    if (gender == Gender.female) {
      halfLife *= 1.2; // 여성은 약간 느림
    }

    return halfLife;
  }

  /// 현재 체내 카페인 농도 계산 (mg)
  static double getCurrentLevel({
    required List<DrinkRecordModel> records,
    required Gender gender,
    required bool smoking,
  }) {
    final halfLife = getHalfLife(gender: gender, smoking: smoking);
    final now = DateTime.now();
    double total = 0.0;

    for (final record in records) {
      final minutesElapsed = now
          .difference(record.drinkAt)
          .inMinutes
          .toDouble();

      // 흡수 전 (마신 후 45분 이전)
      if (minutesElapsed < 45) {
        // 45분까지 선형으로 증가
        final absorbed = record.caffeineAmount * (minutesElapsed / 45);
        total += absorbed;
      } else {
        // 45분 이후 반감기로 감소
        final hoursElapsed = (minutesElapsed - 45) / 60.0;
        total += record.caffeineAmount * pow(0.5, hoursElapsed / halfLife);
      }
    }

    return total;
  }

  /// 예상 수면 가능 시간 계산
  /// 카페인 25mg 이하면 수면 가능
  static DateTime? getSleepTime({
    required List<DrinkRecordModel> records,
    required Gender gender,
    required bool smoking,
    double sleepThreshold = 25.0,
  }) {
    final currentLevel = getCurrentLevel(
      records: records,
      gender: gender,
      smoking: smoking,
    );

    if (currentLevel <= sleepThreshold) return DateTime.now();

    final halfLife = getHalfLife(gender: gender, smoking: smoking);

    final hoursUntilSleep =
        halfLife * (log(currentLevel / sleepThreshold) / log(2));

    final result = DateTime.now().add(
      Duration(minutes: (hoursUntilSleep * 60).toInt()),
    );

    final canSleepNow = result.isBefore(DateTime.now());

    return canSleepNow ? DateTime.now() : result;
  }

  /// 일일 권장량 대비 퍼센트
  static double getRemainingPercent({
    required double currentLevel,
    required double targetAmount,
  }) {
    return (currentLevel / targetAmount * 100).clamp(0, 100);
  }
}
