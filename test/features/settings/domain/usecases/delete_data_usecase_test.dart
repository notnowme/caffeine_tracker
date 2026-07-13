import 'package:caffeine_tracker/core/db/repositories/local_db_repository.dart';
import 'package:caffeine_tracker/features/settings/domain/usecases/delete_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_data_usecase_test.mocks.dart';

@GenerateMocks([CaffeineItemRepository])
void main() {
  late MockCaffeineItemRepository repo;

  setUp(() {
    repo = MockCaffeineItemRepository();
  });

  group('DeleteDataUsecase', () {
    test('deleteAllDatas를 호출하고 삭제된 행 수를 그대로 반환한다', () async {
      // given
      when(repo.deleteAllDatas()).thenAnswer((_) async => 5);
      final useCase = DeleteDataUsecase(repo);

      // when
      final result = await useCase.execute();

      // then
      expect(result, 5);
      verify(repo.deleteAllDatas()).called(1);
    });
  });
}
