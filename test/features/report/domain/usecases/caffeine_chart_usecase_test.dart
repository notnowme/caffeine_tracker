import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_chart_usecase.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 6, 28, 12);

  DrinkRecordWithItem withItem({required double amount, required DateTime at}) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: amount,
        isCustom: false,
        drinkAt: at,
      ),
      item: null,
    );
  }

  group('GetCaffeineChartDataByDateUseCase', () {
    test('주간은 길이 7의 배열을 반환하고 기록이 없으면 모두 0이다', () {
      // when
      final result = GetCaffeineChartDataByDateUseCase().execute(
        [],
        ChartDate.week,
        now,
      );

      // then
      expect(result.length, 7);
      expect(result.every((e) => e == 0), isTrue);
    });

    test('주간에서 오늘 마신 기록은 마지막 칸에 합산된다', () {
      // given
      final records = [withItem(amount: 100, at: now)];

      // when
      final result = GetCaffeineChartDataByDateUseCase().execute(
        records,
        ChartDate.week,
        now,
      );

      // then
      expect(result.length, 7);
      expect(result.last, 100);
    });

    test('월간은 길이 30의 배열을 반환한다', () {
      // when
      final result = GetCaffeineChartDataByDateUseCase().execute(
        [],
        ChartDate.month,
        now,
      );

      // then
      expect(result.length, 30);
    });

    test('연간은 길이 12의 배열을 반환한다', () {
      // when
      final result = GetCaffeineChartDataByDateUseCase().execute(
        [],
        ChartDate.year,
        now,
      );

      // then
      expect(result.length, 12);
    });
  });
}
