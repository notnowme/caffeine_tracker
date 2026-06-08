import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/domain/usecases/caffeine_record.dart';
import 'package:caffeine_tracker/features/menu/presentation/providers/caffeine_item_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_item_provider.g.dart';

@Riverpod()
class CustomItemNotifer extends _$CustomItemNotifer {
  @override
  CaffeineItemModel build() {
    return CaffeineItemModel(name: '', category: '기타');
  }

  Future<int> add() async {
    final repo = ref.read(caffeineItemRepositoryProvider);
    return await AddCustomItemUseCase(repo).execute(state);
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateCaffeine(double amount) {
    state = state.copyWith(caffeineAmount: amount);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }
}
