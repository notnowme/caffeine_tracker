import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/features/home/presentation/providers/home_caffeine_provider.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository_impl.dart';
import 'package:caffeine_tracker/features/menu/domain/usecases/caffeine_record.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/caffeine_item_provider.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';
import 'package:caffeine_tracker/shared/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_provider.g.dart';

@Riverpod()
RecordRepositoryImpl recordRepositoryImpl(Ref ref) {
  return RecordRepositoryImpl(LocalDataBase());
}

// @Riverpod()
// Future<List<DrinkRecordModel>> recentRecord(Ref ref) async {
//   return await ref.read(recordRepositoryImplProvider).getRecords();
// }

@Riverpod()
class RecentRecordNotifier extends _$RecentRecordNotifier {
  @override
  Future<List<DrinkRecordWithItem>> build() async {
    ref.cacheFor(const Duration(seconds: 30));
    return await ref.read(recordRepositoryImplProvider).getRecordsWithItem();
  }
}

@Riverpod()
class RecordNotifier extends _$RecordNotifier {
  @override
  Future<List<DrinkRecordModel>> build() async {
    return await getTodayRecord();
  }

  Future<List<DrinkRecordModel>> getTodayRecord() async {
    return await ref.read(recordRepositoryImplProvider).getTodayRecords();
  }

  Future<int> add(CaffeineItemModel product) async {
    final repo = ref.read(recordRepositoryImplProvider);
    ref.invalidate(todayDrinksProvider);
    ref.invalidate(currentCaffeineProvider);
    ref.invalidate(todayTotalCaffeineAmountProvider);
    ref.invalidate(recentRecordProvider);
    return await AddDrinkCaffeineUseCase(repo).execute(product);
  }

  Future<int> delete(int id) async {
    final repo = ref.read(caffeineItemRepositoryProvider);
    ref.invalidate(recentRecordProvider);
    ref.invalidate(searchCaffeineItemsProvider);
    return await DeleteCustomItemUseCase(repo).execute(id);
  }
}
