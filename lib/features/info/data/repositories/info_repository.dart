import 'package:caffeine_tracker/features/info/data/models/info_model.dart';

abstract class InfoRepository {
  Future<int> add(InfoModel my);
  Future<InfoModel> getMyInfo();
  Future<int> updateMyInfo(InfoModel my);
}
