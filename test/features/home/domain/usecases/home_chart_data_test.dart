import 'package:caffeine_tracker/features/home/domain/usecases/home_chart_data.dart';
import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_chart_data_test.mocks.dart';

@GenerateMocks([RecordRepository])
void main() {
  late MockRecordRepository repo;

  setUp(() {
    repo = MockRecordRepository();
  });

  // 현재 시각 기준 minutesAgo분 전에 마신 기록 생성 헬퍼
  DrinkRecordWithItem withItem({
    required double caffeineAmount,
    required int minutesAgo,
  }) {
    return DrinkRecordWithItem(
      record: DrinkRecordModel(
        caffeineAmount: caffeineAmount,
        isCustom: false,
        drinkAt: DateTime.now().subtract(Duration(minutes: minutesAgo)),
      ),
      item: null,
    );
  }

  group('GetCaffeineChartDataUseCase', () {
    test('기록이 없으면 13개 포인트를 반환하고 모든 농도가 0이다', () async {
      // given
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer((_) async => []);
      final useCase = GetCaffeineChartDataUseCase(repo);

      // when
      final result = await useCase.execute(
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result.length, 13);
      expect(result.every((spot) => spot.y == 0), isTrue);
    });

    test('포인트의 x값이 0부터 12까지 순서대로 생성된다', () async {
      // given
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer((_) async => [withItem(caffeineAmount: 100, minutesAgo: 60)]);
      final useCase = GetCaffeineChartDataUseCase(repo);

      // when
      final result = await useCase.execute(
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result.length, 13);
      for (int i = 0; i <= 12; i++) {
        expect(result[i].x, i.toDouble());
      }
    });

    test('45분 전 100mg 기록이 있으면 첫 포인트는 0, 마지막 포인트는 약 100이다', () async {
      // given (비흡연 남성, 흡수 완료 시점)
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer((_) async => [withItem(caffeineAmount: 100, minutesAgo: 45)]);
      final useCase = GetCaffeineChartDataUseCase(repo);

      // when
      final result = await useCase.execute(
        gender: Gender.male,
        smoking: false,
      );

      // then (12시간 전 시점에는 아직 안 마셨으므로 0)
      expect(result.first.y, 0);
      // 마지막 포인트(현재 시점)는 흡수 완료된 100mg에 가깝다
      expect(result.last.y, closeTo(100, 1));
    });
  });

  group('GetTodayTotalCaffeineUseCase', () {
    test('기록이 없으면 0을 반환한다', () async {
      // given
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer((_) async => []);
      final useCase = GetTodayTotalCaffeineUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, 0);
    });

    test('여러 기록의 카페인 합산값을 반환한다', () async {
      // given
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer(
        (_) async => [
          withItem(caffeineAmount: 100, minutesAgo: 60),
          withItem(caffeineAmount: 50, minutesAgo: 120),
        ],
      );
      final useCase = GetTodayTotalCaffeineUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, 150);
    });

    test('합산값의 소수점은 버려진다', () async {
      // given (100.7 + 50.8 = 151.5)
      when(
        repo.getRecordsByRange(
          from: anyNamed('from'),
          to: anyNamed('to'),
        ),
      ).thenAnswer(
        (_) async => [
          withItem(caffeineAmount: 100.7, minutesAgo: 60),
          withItem(caffeineAmount: 50.8, minutesAgo: 120),
        ],
      );
      final useCase = GetTodayTotalCaffeineUseCase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, 151);
    });
  });
}
