import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';

enum OrderBy { asc, desc }

abstract class RecordRepository {
  Future<int> addRecord(DrinkRecordModel product);
  Future<List<DrinkRecordModel>> getRecords();
  Future<List<DrinkRecordModel>> getTodayRecords();
  Future<List<DrinkRecordWithItem>> getRecordsByRange({
    required DateTime from,
    required DateTime to,
    OrderBy orderBy = OrderBy.asc,
  });
  Future<List<DrinkRecordWithItem>> getRecordsWithItem();
  Future<CaffeineItemModel?> getItemById({
    required bool isCustom,
    required int id,
  });
  Future<void> deleteRecord(int id);
}
