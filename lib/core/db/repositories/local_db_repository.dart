import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';

abstract class CaffeineItemRepository {
  Future<List<CaffeineItemModel>> getAllItems();
  Future<List<CaffeineItemModel>> getOfficialItems();
  Future<List<CaffeineItemModel>> getCustomItems();
  Future<List<CaffeineItemModel>> searchItems(
    String keyword, {
    CaffeineCategory? category,
  });
  Future<List<CaffeineItemModel>> getItemsByHits();
  Future<CaffeineItemModel?> getItemById({
    required bool isCustom,
    required int id,
  });
  Future<int> addCustomItem(CaffeineItemModel item);
  Future<void> incrementHits(int id, bool isCustom);
  Future<int> deleteCustomItem(int id);
  Future<int> deleteAllDatas();
}
