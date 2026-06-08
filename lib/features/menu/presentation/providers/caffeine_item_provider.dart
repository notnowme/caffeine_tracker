import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/core/db/repositories/local_db_repositoryImpl.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/search_text_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'caffeine_item_provider.g.dart';

@Riverpod()
CaffeineItemRepositoryImpl caffeineItemRepository(Ref ref) {
  return CaffeineItemRepositoryImpl(LocalDataBase());
}

@Riverpod()
Future<List<CaffeineItemModel>> allCaffeineItems(Ref ref) async {
  return ref.read(caffeineItemRepositoryProvider).getAllItems();
}

@Riverpod()
class SearchCaffeineItemsNotifier extends _$SearchCaffeineItemsNotifier {
  @override
  Future<List<CaffeineItemModel>> build() async {
    final keyword = ref.watch(searchTextProvider);
    if (keyword.isEmpty) return [];

    // 이전 데이터 유지
    if (state is AsyncData) {
      state = AsyncData(state.value ?? []);
    }

    return ref.read(caffeineItemRepositoryProvider).searchItems(keyword);
  }
}
