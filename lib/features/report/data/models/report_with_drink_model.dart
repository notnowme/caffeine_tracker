import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';

class DrinkRecordWithItem {
  final DrinkRecordModel record;
  final CaffeineItemModel? item;

  const DrinkRecordWithItem({required this.record, required this.item});
}
