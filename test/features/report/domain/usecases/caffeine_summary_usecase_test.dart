import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_summary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_summary_usecase_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

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

  void stubRecords(List<DrinkRecordWithItem> records) {
    when(
      repo.getRecordsByRange(from: anyNamed('from'), to: anyNamed('to')),
    ).thenAnswer((_) async => records);
  }

  group('GetCaffeineSummaryUseCase', () {
    test('기록이 없으면 over와 down 모두 0이다', () async {
      // given
      stubRecords([]);
      final useCase = GetCaffeineSummaryUseCase(repo);

      // when
      final result = await useCase.execute(info);

      // then
      expect(result['over'], 0);
      expect(result['down'], 0);
    });

    test('하루 합이 목표량을 초과하면 over가 1 증가한다', () async {
      // given (target 400, 같은 날 합 500)
      final today = DateTime.now();
      stubRecords([
        withItem(amount: 300, at: today),
        withItem(amount: 200, at: today),
      ]);
      final useCase = GetCaffeineSummaryUseCase(repo);

      // when
      final result = await useCase.execute(info);

      // then
      expect(result['over'], 1);
      expect(result['down'], 0);
    });

    test('하루 합이 목표량 이하이면 down이 증가한다', () async {
      // given (target 400, 하루 300)
      stubRecords([withItem(amount: 300, at: DateTime.now())]);
      final useCase = GetCaffeineSummaryUseCase(repo);

      // when
      final result = await useCase.execute(info);

      // then
      expect(result['over'], 0);
      expect(result['down'], 1);
    });
  });
}
