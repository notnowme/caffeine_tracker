import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/core/db/repositories/local_db_repository_impl.dart';
import 'package:caffeine_tracker/features/home/presentation/providers/home_caffeine_provider.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/caffeine_item_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/record_provider.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/search_text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // sqflite를 VM(테스트)에서 사용하기 위한 FFI 초기화.
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  late ProviderContainer container;
  late CaffeineItemRepositoryImpl itemRepo;

  setUp(() async {
    // 실제 Riverpod Provider 사용 (override 없음)
    container = ProviderContainer();
    // LocalDataBase 싱글톤이 FFI 파일 DB를 사용한다.
    // 매 테스트마다 모든 테이블을 비워 격리한다.
    itemRepo = CaffeineItemRepositoryImpl(LocalDataBase());
    await itemRepo.deleteAllDatas();
  });

  tearDown(() {
    container.dispose();
  });

  group('시나리오 2: 음료 추가 -> 카페인 총량 업데이트', () {
    test('음료를 추가하면 오늘 총 카페인량에 반영된다', () async {
      // given (카페인 아이템 등록)
      final id = await itemRepo.addCustomItem(
        const CaffeineItemModel(
          name: '핸드드립',
          category: '카페 커피',
          caffeineAmount: 150,
          isCustom: 1,
        ),
      );
      final product = CaffeineItemModel(
        id: id,
        name: '핸드드립',
        caffeineAmount: 150,
        isCustom: 1,
      );

      // 초기 총량은 0
      final before = await container.read(
        todayTotalCaffeineAmountProvider.future,
      );
      expect(before, 0);

      // when (음료 기록 추가)
      await container.read(recordProvider.notifier).add(product);
      // 화면 재진입/갱신 시뮬레이션 (RecordNotifier.add는 이 provider를 직접 갱신하지 않음)
      container.invalidate(todayTotalCaffeineAmountProvider);

      // then
      final after = await container.read(
        todayTotalCaffeineAmountProvider.future,
      );
      expect(after, 150);
    });

    test('여러 음료를 추가하면 총량이 누적된다', () async {
      // given
      final id = await itemRepo.addCustomItem(
        const CaffeineItemModel(
          name: '에스프레소',
          category: '카페 커피',
          caffeineAmount: 80,
          isCustom: 1,
        ),
      );
      final product = CaffeineItemModel(
        id: id,
        name: '에스프레소',
        caffeineAmount: 80,
        isCustom: 1,
      );

      // when (2회 추가)
      await container.read(recordProvider.notifier).add(product);
      await container.read(recordProvider.notifier).add(product);
      container.invalidate(todayTotalCaffeineAmountProvider);

      // then
      final total = await container.read(
        todayTotalCaffeineAmountProvider.future,
      );
      expect(total, 160);
    });
  });

  group('시나리오 3: 검색 -> 음료 검색 -> 결과 표시 -> 선택 -> 기록 추가', () {
    test('아이템을 검색해 찾고, 선택해 기록하면 총량에 반영된다', () async {
      // given (검색 대상 아이템 등록)
      await itemRepo.addCustomItem(
        const CaffeineItemModel(
          name: '콜드브루',
          category: '카페 커피',
          caffeineAmount: 200,
          isCustom: 1,
        ),
      );

      // 디바운스 타이머가 발화할 때까지 provider가 dispose되지 않도록 구독 유지
      // (실제 앱에서는 메뉴 화면이 watch하여 유지된다)
      container.listen(searchTextProvider, (_, _) {});

      // when (검색어 입력 - 300ms 디바운스 후 반영)
      container.read(searchTextProvider.notifier).change('콜드');
      await Future.delayed(const Duration(milliseconds: 350));
      final results = await container.read(searchCaffeineItemsProvider.future);

      // then (검색 결과에 등록한 아이템이 포함된다)
      expect(results.any((e) => e.name == '콜드브루'), isTrue);

      // when (검색 결과에서 선택하여 기록 추가)
      final selected = results.firstWhere((e) => e.name == '콜드브루');
      await container.read(recordProvider.notifier).add(selected);
      container.invalidate(todayTotalCaffeineAmountProvider);

      // then (총량에 반영)
      final total = await container.read(
        todayTotalCaffeineAmountProvider.future,
      );
      expect(total, 200);
    });

    test('검색어가 일치하는 아이템이 없으면 빈 결과를 반환한다', () async {
      // given
      await itemRepo.addCustomItem(
        const CaffeineItemModel(
          name: '아메리카노',
          category: '카페 커피',
          caffeineAmount: 150,
          isCustom: 1,
        ),
      );

      // 디바운스 타이머 발화까지 구독 유지
      container.listen(searchTextProvider, (_, _) {});

      // when
      container.read(searchTextProvider.notifier).change('존재하지않는음료');
      await Future.delayed(const Duration(milliseconds: 350));
      final results = await container.read(searchCaffeineItemsProvider.future);

      // then
      expect(results, isEmpty);
    });
  });
}
