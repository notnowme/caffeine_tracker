import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/core/db/repositories/local_db_repository.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:sqflite/sqflite.dart';

class CaffeineItemRepositoryImpl implements CaffeineItemRepository {
  final LocalDataBase _db;
  CaffeineItemRepositoryImpl(this._db);

  @override
  Future<List<CaffeineItemModel>> getAllItems() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_supabase
      UNION ALL
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_local
      ORDER BY name
    ''');
    return result.map((item) => CaffeineItemModel.fromMap(item)).toList();
  }

  @override
  Future<List<CaffeineItemModel>> getOfficialItems() async {
    final db = await _db.database;
    final result = await db.query('caffeine_items_from_supabase');
    return result.map((item) => CaffeineItemModel.fromMap(item)).toList();
  }

  @override
  Future<List<CaffeineItemModel>> getCustomItems() async {
    final db = await _db.database;
    final result = await db.query('caffeine_items_from_local');
    return result.map((item) => CaffeineItemModel.fromMap(item)).toList();
  }

  @override
  Future<List<CaffeineItemModel>> searchItems(
    String keyword, {
    CaffeineCategory? category,
  }) async {
    final db = await _db.database;

    final categoryWhere = category != null
        ? 'AND category_id = ${category.id}'
        : '';

    final result = await db.rawQuery(
      '''
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_supabase
      WHERE (name LIKE ? OR brand LIKE ?) $categoryWhere
      UNION ALL
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_local
      WHERE (name LIKE ? OR brand LIKE ?) $categoryWhere
      ORDER BY name
    ''',
      ['%$keyword%', '%$keyword%', '%$keyword%', '%$keyword%'],
    );
    if (result.isEmpty) return [];
    return result.map((item) => CaffeineItemModel.fromMap(item)).toList();
  }

  @override
  Future<List<CaffeineItemModel>> getItemsByHits() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_supabase
      UNION ALL
      SELECT id, category_id, name, brand, service_size, volume_ml, caffeine_amount, hits, is_custom
      FROM caffeine_items_from_local
      ORDER BY hits DESC
    ''');
    return result.map((item) => CaffeineItemModel.fromMap(item)).toList();
  }

  @override
  Future<CaffeineItemModel?> getItemById({
    required bool isCustom,
    required int id,
  }) async {
    final db = await _db.database;
    final table = isCustom
        ? 'caffeine_items_from_local'
        : 'caffeine_items_from_supabase';
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return CaffeineItemModel.fromMap(result.first);
  }

  @override
  Future<int> addCustomItem(CaffeineItemModel item) async {
    final db = await _db.database;
    final result = await db.insert(
      'caffeine_items_from_local',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  @override
  Future<void> incrementHits(int id, bool isCustom) async {
    final db = await _db.database;
    final table = isCustom
        ? 'caffeine_items_from_local'
        : 'caffeine_items_from_supabase';
    await db.rawUpdate('UPDATE $table SET hits = hits + 1 WHERE id = ?', [id]);
  }

  @override
  Future<int> deleteCustomItem(int id) async {
    try {
      final db = await _db.database;
      final result = await db.delete(
        'caffeine_items_from_local',
        where: 'id = ?',
        whereArgs: [id],
      );
      return result;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  @override
  Future<int> deleteAllDatas() async {
    try {
      final db = await _db.database;
      await Future.wait([
        db.delete('info'),
        db.delete('caffeine_items_from_supabase'),
        db.delete('caffeine_items_from_local'),
        db.delete('drink_records'),
        db.update(
          'data_version',
          {'version': 0},
          where: 'id = ?',
          whereArgs: [1],
        ),
      ]);
      return 1;
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
