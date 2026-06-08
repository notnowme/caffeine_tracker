import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_time_pattern_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_time_pattern_usecase_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

  // 오늘 특정 시각(hour)에 마신 기록 생성
  DrinkRecordWithItem withItem({required double amount, required int hour}) {
    final now = DateTime.now();
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: amount,
        isCustom: false,
        drinkAt: DateTime(now.year, now.month, now.day, hour),
      ),
      item: null,
    );
  }

  void stubRecords(List<DrinkRecordWithItem> records) {
    when(
      repo.getRecordsByRange(from: anyNamed('from'), to: anyNamed('to')),
    ).thenAnswer((_) async => records);
  }

  group('GetCaffeineTimePatternUseCase', () {
    test('기록이 없으면 길이 24의 0 배열을 반환한다', () async {
      // given
      stubRecords([]);
      final useCase = GetCaffeineTimePatternUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result.length, 24);
      expect(result.every((e) => e == 0), isTrue);
    });

    test('마신 시각의 인덱스에만 카페인이 합산된다', () async {
      // given (9시에 100mg)
      stubRecords([withItem(amount: 100, hour: 9)]);
      final useCase = GetCaffeineTimePatternUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result[9], 100);
      expect(result.where((e) => e != 0).length, 1);
    });

    test('같은 시각의 여러 기록은 해당 인덱스에 합산된다', () async {
      // given (9시에 100, 50)
      stubRecords([
        withItem(amount: 100, hour: 9),
        withItem(amount: 50, hour: 9),
      ]);
      final useCase = GetCaffeineTimePatternUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result[9], 150);
    });
  });
}
