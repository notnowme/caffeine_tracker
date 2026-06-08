import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/features/report/domain/usecases/caffeine_chart_usecase.dart';
import 'package:caffeine_tracker/features/report/presentation/providers/report_chart_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_chart_usecase_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

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

  group('GetCaffeineChartDataByDateUseCase', () {
    test('주간은 길이 7의 배열을 반환하고 기록이 없으면 모두 0이다', () async {
      // given
      stubRecords([]);
      final useCase = GetCaffeineChartDataByDateUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.week);

      // then
      expect(result.length, 7);
      expect(result.every((e) => e == 0), isTrue);
    });

    test('주간에서 오늘 마신 기록은 마지막 칸에 합산된다', () async {
      // given
      stubRecords([withItem(amount: 100, at: DateTime.now())]);
      final useCase = GetCaffeineChartDataByDateUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.week);

      // then
      expect(result.length, 7);
      expect(result.last, 100);
    });

    test('월간은 길이 30의 배열을 반환한다', () async {
      // given
      stubRecords([]);
      final useCase = GetCaffeineChartDataByDateUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.month);

      // then
      expect(result.length, 30);
    });

    test('연간은 길이 12의 배열을 반환한다', () async {
      // given
      stubRecords([]);
      final useCase = GetCaffeineChartDataByDateUseCase(repo);

      // when
      final result = await useCase.execute(ChartDate.year);

      // then
      expect(result.length, 12);
    });
  });
}
