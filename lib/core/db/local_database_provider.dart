import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'local_database.dart';

part 'local_database_provider.g.dart';

@Riverpod()
LocalDataBase localDatabase(Ref ref) {
  return LocalDataBase();
}
