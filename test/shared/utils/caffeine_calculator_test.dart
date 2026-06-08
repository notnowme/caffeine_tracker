import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/shared/utils/caffeine_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 현재 시각 기준 minutes 전에 마신 기록 생성 헬퍼
  DrinkRecordModel record({
    required double caffeineAmount,
    required int minutesAgo,
  }) {
    return DrinkRecordModel(
      caffeineAmount: caffeineAmount,
      isCustom: false,
      drinkAt: DateTime.now().subtract(Duration(minutes: minutesAgo)),
    );
  }

  group('getHalfLife', () {
    test('비흡연 남성은 반감기가 5시간이다', () {
      // given
      const gender = Gender.male;
      const smoking = false;

      // when
      final result = CaffeineCalculator.getHalfLife(
        gender: gender,
        smoking: smoking,
      );

      // then
      expect(result, 5.0);
    });

    test('흡연 남성은 반감기가 2.5시간이다', () {
      // given
      const gender = Gender.male;
      const smoking = true;

      // when
      final result = CaffeineCalculator.getHalfLife(
        gender: gender,
        smoking: smoking,
      );

      // then
      expect(result, 2.5);
    });

    test('비흡연 여성은 반감기가 6시간이다', () {
      // given
      const gender = Gender.female;
      const smoking = false;

      // when
      final result = CaffeineCalculator.getHalfLife(
        gender: gender,
        smoking: smoking,
      );

      // then
      expect(result, 6.0);
    });

    test('흡연 여성은 반감기가 3시간이다', () {
      // given
      const gender = Gender.female;
      const smoking = true;

      // when
      final result = CaffeineCalculator.getHalfLife(
        gender: gender,
        smoking: smoking,
      );

      // then
      expect(result, 3.0);
    });
  });

  group('getCurrentLevel', () {
    test('기록이 없으면 0을 반환한다', () {
      // given
      final records = <DrinkRecordModel>[];

      // when
      final result = CaffeineCalculator.getCurrentLevel(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, 0.0);
    });

    test('마신 직후(0분 경과)에는 0에 가까운 값을 반환한다', () {
      // given
      final records = [record(caffeineAmount: 100, minutesAgo: 0)];

      // when
      final result = CaffeineCalculator.getCurrentLevel(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, closeTo(0, 1));
    });

    test('45분 경과 후에는 흡수가 완료되어 caffeineAmount와 같다', () {
      // given
      final records = [record(caffeineAmount: 100, minutesAgo: 45)];

      // when
      final result = CaffeineCalculator.getCurrentLevel(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, closeTo(100, 1));
    });

    test('비흡연 남성 기준 흡수완료 후 반감기(5시간)가 지나면 절반이 된다', () {
      // given (45분 흡수 + 5시간 경과 = 285분 전)
      final records = [record(caffeineAmount: 100, minutesAgo: 45 + 300)];

      // when
      final result = CaffeineCalculator.getCurrentLevel(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, closeTo(50, 1));
    });

    test('여러 기록의 농도를 합산한다', () {
      // given (둘 다 흡수 완료된 시점)
      final records = [
        record(caffeineAmount: 100, minutesAgo: 45),
        record(caffeineAmount: 50, minutesAgo: 45),
      ];

      // when
      final result = CaffeineCalculator.getCurrentLevel(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, closeTo(150, 1));
    });
  });

  group('getSleepTime', () {
    test('농도가 25mg 이하이면 지금 바로 수면 가능하다', () {
      // given (기록 없음 -> 농도 0)
      final records = <DrinkRecordModel>[];
      final before = DateTime.now();

      // when
      final result = CaffeineCalculator.getSleepTime(
        records: records,
        gender: Gender.male,
        smoking: false,
      );
      final after = DateTime.now();

      // then (now 시점이 반환됨)
      expect(result, isNotNull);
      expect(
        result!.isAfter(before.subtract(const Duration(seconds: 1))) &&
            result.isBefore(after.add(const Duration(seconds: 1))),
        isTrue,
      );
    });

    test('농도가 높으면 현재보다 미래의 수면 가능 시각을 반환한다', () {
      // given (고용량 직후 흡수 완료 시점)
      final records = [record(caffeineAmount: 200, minutesAgo: 45)];

      // when
      final result = CaffeineCalculator.getSleepTime(
        records: records,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(result, isNotNull);
      expect(result!.isAfter(DateTime.now()), isTrue);
    });

    test('농도가 높을수록 수면 가능 시각이 더 늦어진다', () {
      // given
      final lowRecords = [record(caffeineAmount: 100, minutesAgo: 45)];
      final highRecords = [record(caffeineAmount: 300, minutesAgo: 45)];

      // when
      final lowSleep = CaffeineCalculator.getSleepTime(
        records: lowRecords,
        gender: Gender.male,
        smoking: false,
      );
      final highSleep = CaffeineCalculator.getSleepTime(
        records: highRecords,
        gender: Gender.male,
        smoking: false,
      );

      // then
      expect(highSleep!.isAfter(lowSleep!), isTrue);
    });
  });

  group('getRemainingPercent', () {
    test('현재량이 목표량의 절반이면 50%를 반환한다', () {
      // given
      const currentLevel = 200.0;
      const targetAmount = 400.0;

      // when
      final result = CaffeineCalculator.getRemainingPercent(
        currentLevel: currentLevel,
        targetAmount: targetAmount,
      );

      // then
      expect(result, 50.0);
    });

    test('현재량이 0이면 0%를 반환한다', () {
      // given
      const currentLevel = 0.0;
      const targetAmount = 400.0;

      // when
      final result = CaffeineCalculator.getRemainingPercent(
        currentLevel: currentLevel,
        targetAmount: targetAmount,
      );

      // then
      expect(result, 0.0);
    });

    test('현재량이 목표량을 초과하면 100%로 제한된다', () {
      // given
      const currentLevel = 600.0;
      const targetAmount = 400.0;

      // when
      final result = CaffeineCalculator.getRemainingPercent(
        currentLevel: currentLevel,
        targetAmount: targetAmount,
      );

      // then
      expect(result, 100.0);
    });
  });
}
