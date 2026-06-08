import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_hits_model.dart';

class GetCaffeineAddDescUseCase {
  final RecordRepository repo;
  GetCaffeineAddDescUseCase(this.repo);

  Future<List<DrinkDescModel>> execute() async {
    final result = await repo.getRecordsWithItem();
    final map = <String, DrinkDescModel>{};

    for (final record in result) {
      final name = record.item?.name;
      final category = record.item?.category;
      if (name == null || category == null) continue;

      map[name] = DrinkDescModel(
        name: name,
        category: category,
        count: (map[name]?.count ?? 0) + 1,
      );
    }

    return map.values.toList()..sort((a, b) => b.count.compareTo(a.count));
  }
}
