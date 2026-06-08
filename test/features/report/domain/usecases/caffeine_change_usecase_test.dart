import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_change_usecase.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_change_usecase_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

  DrinkRecordWithItem withItem(double amount) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: amount,
        isCustom: false,
        drinkAt: DateTime.now(),
      ),
      item: null,
    );
  }

  // 이번 기간: from = now-7일, 지난 기간: from = now-14일.
  // from의 시점으로 이번/지난 호출을 구분해 stub 한다.
  void stub({
    required List<DrinkRecordWithItem> current,
    required List<DrinkRecordWithItem> previous,
  }) {
    final boundary = DateTime.now().subtract(const Duration(days: 7));
    when(
      repo.getRecordsByRange(from: anyNamed('from'), to: anyNamed('to')),
    ).thenAnswer((invocation) async {
      final from = invocation.namedArguments[#from] as DateTime;
      return from.isAfter(boundary.subtract(const Duration(days: 1))) &&
              from.isBefore(boundary.add(const Duration(days: 1)))
          ? current
          : previous;
    });
  }

  group('GetCaffeineChangePercentUseCase', () {
    test('지난 기간 합이 0이면 0을 반환한다', () async {
      // given
      stub(current: [withItem(100)], previous: []);
      final useCase = GetCaffeineChangePercentUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.week);

      // then
      expect(result, 0);
    });

    test('이번 200, 지난 100이면 +100%를 반환한다', () async {
      // given
      stub(current: [withItem(200)], previous: [withItem(100)]);
      final useCase = GetCaffeineChangePercentUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.week);

      // then
      expect(result, 100.0);
    });

    test('이번 50, 지난 100이면 -50%를 반환한다', () async {
      // given
      stub(current: [withItem(50)], previous: [withItem(100)]);
      final useCase = GetCaffeineChangePercentUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.week);

      // then
      expect(result, -50.0);
    });
  });
}
