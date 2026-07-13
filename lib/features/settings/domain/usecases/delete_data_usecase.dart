import 'package:caffeine_tracker/core/db/repositories/local_db_repository.dart';

class DeleteDataUsecase {
  final CaffeineItemRepository repo;
  DeleteDataUsecase(this.repo);

  Future<int> execute() async {
    return await repo.deleteAllDatas();
  }
}
