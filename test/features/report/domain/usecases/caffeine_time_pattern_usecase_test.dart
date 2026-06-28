import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_time_pattern_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 최근 1개월 윈도우 내에 들도록 기준일을 고정한다.
  final now = DateTime(2026, 6, 28, 23);

  // 오늘 특정 시각(hour)에 마신 기록 생성
  DrinkRecordWithItem withItem({required double amount, required int hour}) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: amount,
        isCustom: false,
        drinkAt: DateTime(now.year, now.month, now.day, hour),
      ),
      item: null,
    );
  }

  group('GetCaffeineTimePatternUseCase', () {
    test('기록이 없으면 길이 24의 0 배열을 반환한다', () {
      // when
      final result = GetCaffeineTimePatternUseCase().execute([], now);

      // then
      expect(result.length, 24);
      expect(result.every((e) => e == 0), isTrue);
    });

    test('마신 시각의 인덱스에만 카페인이 합산된다', () {
      // given (9시에 100mg)
      final records = [withItem(amount: 100, hour: 9)];

      // when
      final result = GetCaffeineTimePatternUseCase().execute(records, now);

      // then
      expect(result[9], 100);
      expect(result.where((e) => e != 0).length, 1);
    });

    test('같은 시각의 여러 기록은 해당 인덱스에 합산된다', () {
      // given (9시에 100, 50)
      final records = [
        withItem(amount: 100, hour: 9),
        withItem(amount: 50, hour: 9),
      ];

      // when
      final result = GetCaffeineTimePatternUseCase().execute(records, now);

      // then
      expect(result[9], 150);
    });
  });
}
