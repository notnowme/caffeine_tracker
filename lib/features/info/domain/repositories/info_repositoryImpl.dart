import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/features/info/data/models/info_model.dart';
import 'package:caffeine_tracker/features/info/data/repositories/info_repository.dart';
import 'package:sqflite/sqflite.dart';

class InfoRepositoryimpl implements InfoRepository {
  final LocalDataBase _db;
  InfoRepositoryimpl(this._db);

  @override
  Future<int> add(InfoModel my) async {
    final db = await _db.database;
    final result = await db.insert(
      'info',
      my.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  @override
  Future<InfoModel> getMyInfo() async {
    try {
      final db = await _db.database;
      final result = await db.query('info');
      return InfoModel.fromMap(result.first);
    } catch (e) {
      return InfoModel.empty();
    }
  }

  @override
  Future<int> updateMyInfo(InfoModel my) async {
    try {
      final db = await _db.database;
      final result = await db.update(
        'info',
        my.toMap(),
        where: 'id = ?',
        whereArgs: [1],
      );
      return result;
    } catch (e) {
      return 0;
    }
  }
}
