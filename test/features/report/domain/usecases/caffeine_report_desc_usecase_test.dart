import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_report_desc_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_report_desc_usecase_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

  DrinkRecordWithItem withItem(CaffeineItemModel? item) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: 100,
        isCustom: false,
        drinkAt: DateTime.now(),
      ),
      item: item,
    );
  }

  group('GetCaffeineAddDescUseCase', () {
    test('기록이 없으면 빈 리스트를 반환한다', () async {
      // given
      when(repo.getRecordsWithItem()).thenAnswer((_) async => []);
      final useCase = GetCaffeineAddDescUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, isEmpty);
    });

    test('item이 null인 기록은 집계에서 제외된다', () async {
      // given
      when(
        repo.getRecordsWithItem(),
      ).thenAnswer((_) async => [withItem(null)]);
      final useCase = GetCaffeineAddDescUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, isEmpty);
    });

    test('이름별 횟수를 집계하고 count 내림차순으로 정렬한다', () async {
      // given (A 3건, B 1건)
      const itemA = CaffeineItemModel(name: 'A', category: '차류');
      const itemB = CaffeineItemModel(name: 'B', category: '탄산음료');
      when(repo.getRecordsWithItem()).thenAnswer(
        (_) async => [
          withItem(itemA),
          withItem(itemB),
          withItem(itemA),
          withItem(itemA),
        ],
      );
      final useCase = GetCaffeineAddDescUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result.length, 2);
      expect(result.first.name, 'A');
      expect(result.first.count, 3);
      expect(result.last.name, 'B');
      expect(result.last.count, 1);
    });
  });
}
