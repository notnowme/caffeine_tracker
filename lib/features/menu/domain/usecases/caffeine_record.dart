import 'package:caffeine_tracker/core/db/repositories/local_db_repository.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';

class AddDrinkCaffeineUseCase {
  final RecordRepository repo;
  AddDrinkCaffeineUseCase(this.repo);

  Future<int> execute(CaffeineItemModel product) async {
    final record = DrinkRecordModel(
      supabaseItemId: product.isCustom == 1 ? null : product.id,
      localItemId: product.isCustom == 1 ? product.id : null,
      caffeineAmount: product.caffeineAmount,
      isCustom: product.isCustom == 1,
      drinkAt: DateTime.now(),
    );

    return await repo.addRecord(record);
  }
}

class GetItemFromDrinkRecord {
  final CaffeineItemRepository repo;
  GetItemFromDrinkRecord(this.repo);

  Future<CaffeineItemModel?> execute({
    required bool isCustom,
    required int id,
  }) async {
    return await repo.getItemById(isCustom: isCustom, id: id);
  }
}

class AddCustomItemUseCase {
  final CaffeineItemRepository repo;
  AddCustomItemUseCase(this.repo);

  Future<int> execute(CaffeineItemModel item) async {
    final categoryId = CaffeineCategory.fromLabel(item.category);
    final row = item.copyWith(isCustom: 1, categoryId: categoryId!.id);
    return await repo.addCustomItem(row);
  }
}

class DeleteCustomItemUseCase {
  final CaffeineItemRepository repo;
  DeleteCustomItemUseCase(this.repo);

  Future<int> execute(int id) async {
    return await repo.deleteCustomItem(id);
  }
}
