import 'package:caffeine_tracker/core/db/repositories/local_db_repository.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/domain/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/menu/domain/usecases/caffeine_record.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'caffeine_record_test.mocks.dart';

@GenerateMocks([RecordRepository, CaffeineItemRepository])
void main() {
  late MockRecordRepository recordRepo;
  late MockCaffeineItemRepository itemRepo;

  setUp(() {
    recordRepo = MockRecordRepository();
    itemRepo = MockCaffeineItemRepository();
  });

  group('AddDrinkCaffeineUseCase', () {
    test('공식 아이템은 supabaseItemId에 id가 들어가고 isCustom은 false로 기록된다', () async {
      // given
      const product = CaffeineItemModel(
        id: 10,
        name: '아메리카노',
        caffeineAmount: 150,
        isCustom: 0,
      );
      when(recordRepo.addRecord(any)).thenAnswer((_) async => 1);
      final useCase = AddDrinkCaffeineUseCase(recordRepo);

      // when
      await useCase.execute(product);

      // then
      final captured =
          verify(recordRepo.addRecord(captureAny)).captured.single
              as DrinkRecordModel;
      expect(captured.supabaseItemId, 10);
      expect(captured.localItemId, isNull);
      expect(captured.isCustom, isFalse);
      expect(captured.caffeineAmount, 150);
    });

    test('커스텀 아이템은 localItemId에 id가 들어가고 isCustom은 true로 기록된다', () async {
      // given
      const product = CaffeineItemModel(
        id: 20,
        name: '나만의 커피',
        caffeineAmount: 80,
        isCustom: 1,
      );
      when(recordRepo.addRecord(any)).thenAnswer((_) async => 1);
      final useCase = AddDrinkCaffeineUseCase(recordRepo);

      // when
      await useCase.execute(product);

      // then
      final captured =
          verify(recordRepo.addRecord(captureAny)).captured.single
              as DrinkRecordModel;
      expect(captured.localItemId, 20);
      expect(captured.supabaseItemId, isNull);
      expect(captured.isCustom, isTrue);
    });

    test('addRecord가 반환한 값을 그대로 반환한다', () async {
      // given
      const product = CaffeineItemModel(name: '콜라', caffeineAmount: 23);
      when(recordRepo.addRecord(any)).thenAnswer((_) async => 99);
      final useCase = AddDrinkCaffeineUseCase(recordRepo);

      // when
      final result = await useCase.execute(product);

      // then
      expect(result, 99);
    });
  });

  group('GetItemFromDrinkRecord', () {
    test('repo가 반환한 아이템을 그대로 반환하고 인자를 전달한다', () async {
      // given
      const item = CaffeineItemModel(id: 5, name: '라떼', caffeineAmount: 75);
      when(
        itemRepo.getItemById(isCustom: anyNamed('isCustom'), id: anyNamed('id')),
      ).thenAnswer((_) async => item);
      final useCase = GetItemFromDrinkRecord(itemRepo);

      // when
      final result = await useCase.execute(isCustom: false, id: 5);

      // then
      expect(result, item);
      verify(itemRepo.getItemById(isCustom: false, id: 5)).called(1);
    });

    test('repo가 null을 반환하면 null을 반환한다', () async {
      // given
      when(
        itemRepo.getItemById(isCustom: anyNamed('isCustom'), id: anyNamed('id')),
      ).thenAnswer((_) async => null);
      final useCase = GetItemFromDrinkRecord(itemRepo);

      // when
      final result = await useCase.execute(isCustom: true, id: 1);

      // then
      expect(result, isNull);
    });
  });

  group('AddCustomItemUseCase', () {
    test('category 라벨이 categoryId로 변환되고 isCustom이 1로 설정되어 저장된다', () async {
      // given (차류 -> id 6)
      const item = CaffeineItemModel(
        name: '녹차',
        category: '차류',
        caffeineAmount: 30,
      );
      when(itemRepo.addCustomItem(any)).thenAnswer((_) async => 1);
      final useCase = AddCustomItemUseCase(itemRepo);

      // when
      await useCase.execute(item);

      // then
      final captured =
          verify(itemRepo.addCustomItem(captureAny)).captured.single
              as CaffeineItemModel;
      expect(captured.categoryId, 6);
      expect(captured.isCustom, 1);
    });

    test('addCustomItem이 반환한 값을 그대로 반환한다', () async {
      // given
      const item = CaffeineItemModel(name: '녹차', category: '차류');
      when(itemRepo.addCustomItem(any)).thenAnswer((_) async => 42);
      final useCase = AddCustomItemUseCase(itemRepo);

      // when
      final result = await useCase.execute(item);

      // then
      expect(result, 42);
    });
  });

  group('DeleteCustomItemUseCase', () {
    test('전달받은 id로 deleteCustomItem을 호출하고 반환값을 그대로 반환한다', () async {
      // given
      when(itemRepo.deleteCustomItem(any)).thenAnswer((_) async => 1);
      final useCase = DeleteCustomItemUseCase(itemRepo);

      // when
      final result = await useCase.execute(7);

      // then
      expect(result, 1);
      verify(itemRepo.deleteCustomItem(7)).called(1);
    });
  });
}
