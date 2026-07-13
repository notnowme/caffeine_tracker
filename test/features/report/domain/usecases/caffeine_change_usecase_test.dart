import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_change_usecase.dart';
import 'package:caffeine_tracker/features/report/domain/entities/chart_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 기준 시각 고정. 주간: 이번 [now-7d, now], 지난 [now-14d, now-7d].
  final now = DateTime(2026, 6, 28, 12);

  DrinkRecordWithItem rec(double amount, DateTime at) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: amount,
        isCustom: false,
        drinkAt: at,
      ),
      item: null,
    );
  }

  group('GetCaffeineChangePercentUseCase', () {
    test('지난 기간 합이 0이면 0을 반환한다', () {
      // given (이번 기간에만 기록)
      final records = [rec(100, now.subtract(const Duration(days: 1)))];

      // when
      final result = GetCaffeineChangePercentUseCase().execute(
        records,
        ChartDate.week,
        now,
      );

      // then
      expect(result, 0);
    });

    test('이번 200, 지난 100이면 +100%를 반환한다', () {
      // given (이번: now-1d, 지난: now-8d)
      final records = [
        rec(200, now.subtract(const Duration(days: 1))),
        rec(100, now.subtract(const Duration(days: 8))),
      ];

      // when
      final result = GetCaffeineChangePercentUseCase().execute(
        records,
        ChartDate.week,
        now,
      );

      // then
      expect(result, 100.0);
    });

    test('이번 50, 지난 100이면 -50%를 반환한다', () {
      // given
      final records = [
        rec(50, now.subtract(const Duration(days: 1))),
        rec(100, now.subtract(const Duration(days: 8))),
      ];

      // when
      final result = GetCaffeineChangePercentUseCase().execute(
        records,
        ChartDate.week,
        now,
      );

      // then
      expect(result, -50.0);
    });
  });
}
