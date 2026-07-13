import 'package:caffeine_tracker/core/db/local_database_provider.dart';
import 'package:caffeine_tracker/core/db/secure_storage.dart';
import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/info/data/repositories/info_repository_impl.dart';
import 'package:caffeine_tracker/features/info/domain/repositories/info_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_provider.g.dart';

@Riverpod()
InfoRepository infoRepository(Ref ref) {
  return InfoRepositoryImpl(ref.watch(localDatabaseProvider));
}

// 정보는 거의 변하지 않으므로 페이지가 사라져도 유지시키기
@Riverpod(keepAlive: true)
class MyInfoNotifier extends _$MyInfoNotifier {
  @override
  Future<InfoModel> build() async {
    return await getMyInfo();
  }

  Future<InfoModel> getMyInfo() async {
    final repo = ref.read(infoRepositoryProvider);
    return await repo.getMyInfo();
  }

  Future<void> updateMyInfo() async {
    state = AsyncValue.data(await getMyInfo());
  }
}

@Riverpod()
class InfoNotifier extends _$InfoNotifier {
  @override
  InfoModel build() {
    return InfoModel.empty();
  }

  bool get nameIsShort => state.name.length < 3;
  bool get weightIsWrong => state.weight <= 30;

  void init() {
    state = ref.read(myInfoProvider).value!;
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  void updateWeight(double weight) {
    state = state.copyWith(weight: weight);
  }

  void updateAge(int age) {
    state = state.copyWith(age: age);
  }

  void updateSmoking(bool smoking) {
    state = state.copyWith(smoking: smoking);
  }

  void updateSense(Sensitive sense) {
    state = state.copyWith(sense: sense);
  }

  void updateAmount(double amount) {
    state = state.copyWith(targetAmount: amount);
  }

  void reset() {
    state = InfoModel.empty();
  }

  Future<int> add() async {
    final repo = ref.read(infoRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: 'signed', value: '0');
    return await repo.add(state);
  }

  Future<int> update() async {
    final repo = ref.read(infoRepositoryProvider);
    final result = await repo.updateMyInfo(state);
    await ref.read(myInfoProvider.notifier).updateMyInfo();
    return result;
  }
}
