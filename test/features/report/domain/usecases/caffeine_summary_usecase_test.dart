import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_summary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 6, 28, 12);
  final info = InfoModel.empty().copyWith(targetAmount: 400);

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

  group('GetCaffeineSummaryUseCase', () {
    test('기록이 없으면 over와 down 모두 0이다', () {
      // when
      final result = GetCaffeineSummaryUseCase().execute([], info, now);

      // then
      expect(result['over'], 0);
      expect(result['down'], 0);
    });

    test('하루 합이 목표량을 초과하면 over가 1 증가한다', () {
      // given (target 400, 같은 날 합 500)
      final records = [
        withItem(amount: 300, at: now),
        withItem(amount: 200, at: now),
      ];

      // when
      final result = GetCaffeineSummaryUseCase().execute(records, info, now);

      // then
      expect(result['over'], 1);
      expect(result['down'], 0);
    });

    test('하루 합이 목표량 이하이면 down이 증가한다', () {
      // given (target 400, 하루 300)
      final records = [withItem(amount: 300, at: now)];

      // when
      final result = GetCaffeineSummaryUseCase().execute(records, info, now);

      // then
      expect(result['over'], 0);
      expect(result['down'], 1);
    });
  });
}
