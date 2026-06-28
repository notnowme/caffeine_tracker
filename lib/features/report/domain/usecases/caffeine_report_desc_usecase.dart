import 'package:caffeine_tracker/features/report/data/models/report_hits_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';

class GetCaffeineAddDescUseCase {
  // 전체 기록(item 포함)을 받아 음료 이름별 횟수를 집계한다.
  List<DrinkDescModel> execute(List<DrinkRecordWithItem> records) {
    final map = <String, DrinkDescModel>{};

    for (final record in records) {
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
