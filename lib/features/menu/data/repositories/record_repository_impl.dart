import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/domain/repositories/record_repository.dart';
import 'package:caffeine_tracker/features/report/data/models/report_model.dart';
import 'package:caffeine_tracker/features/report/data/models/report_with_drink_model.dart';

class RecordRepositoryImpl implements RecordRepository {
  final LocalDataBase _db;
  RecordRepositoryImpl(this._db);

  @override
  Future<int> addRecord(DrinkRecordModel record) async {
    final db = await _db.database;
    final table = record.isCustom
        ? 'caffeine_items_from_local'
        : 'caffeine_items_from_supabase';
    final result = await db.insert('drink_records', record.toMap());
    final productId = record.isCustom
        ? record.localItemId
        : record.supabaseItemId;
    await db.rawUpdate('UPDATE $table SET hits = hits + 1 WHERE id = ?', [
      productId,
    ]);
    return result;
  }

  @override
  Future<List<DrinkRecordModel>> getRecords() async {
    final db = await _db.database;
    final result = await db.query('drink_records', orderBy: 'drink_at DESC');
    return result.map((map) => DrinkRecordModel.fromMap(map)).toList();
  }

  @override
  Future<List<DrinkRecordModel>> getTodayRecords() async {
    final db = await _db.database;
    final today = DateTime.now();
    final start = DateTime(
      today.year,
      today.month,
      today.day,
    ).toIso8601String();
    final end = DateTime(
      today.year,
      today.month,
      today.day + 1,
    ).toIso8601String();

    final result = await db.query(
      'drink_records',
      where: 'drink_at BETWEEN ? AND ?',
      whereArgs: [start, end],
    );

    return result.map((map) => DrinkRecordModel.fromMap(map)).toList();
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
  Future<List<DrinkRecordWithItem>> getRecordsWithItem() async {
    final records = await getRecords();
    return _attachItems(records);
  }

  @override
  Future<List<DrinkRecordWithItem>> getRecordsByRange({
    required DateTime from,
    required DateTime to,
    OrderBy orderBy = OrderBy.asc,
  }) async {
    final db = await _db.database;
    final result = await db.query(
      'drink_records',
      where: 'drink_at BETWEEN ? AND ?',
      whereArgs: [from.toIso8601String(), to.toIso8601String()],
      orderBy: 'drink_at ${orderBy.name.toUpperCase()}',
    );
    final records = result.map((map) => DrinkRecordModel.fromMap(map)).toList();
    return _attachItems(records);
  }

  // 레코드 목록에 item을 붙인다. 레코드당 1쿼리(N+1) 대신 테이블별 IN 조회로
  // 일괄 조회한다(레코드 순서 보존, item 미존재 시 null — getItemById와 동일).
  Future<List<DrinkRecordWithItem>> _attachItems(
    List<DrinkRecordModel> records,
  ) async {
    if (records.isEmpty) return [];

    final localIds = <int>{};
    final supabaseIds = <int>{};
    for (final record in records) {
      if (record.isCustom) {
        if (record.localItemId != null) localIds.add(record.localItemId!);
      } else {
        if (record.supabaseItemId != null) {
          supabaseIds.add(record.supabaseItemId!);
        }
      }
    }

    final localItems = await _fetchItemsByIds(
      'caffeine_items_from_local',
      localIds,
    );
    final supabaseItems = await _fetchItemsByIds(
      'caffeine_items_from_supabase',
      supabaseIds,
    );

    return records.map((record) {
      final item = record.isCustom
          ? localItems[record.localItemId]
          : supabaseItems[record.supabaseItemId];
      return DrinkRecordWithItem(record: record, item: item);
    }).toList();
  }

  // 단일 테이블에서 id 집합을 한 번의 IN 쿼리로 조회해 id→item 맵으로 반환.
  Future<Map<int, CaffeineItemModel>> _fetchItemsByIds(
    String table,
    Set<int> ids,
  ) async {
    if (ids.isEmpty) return {};
    final db = await _db.database;
    final placeholders = List.filled(ids.length, '?').join(',');
    final result = await db.query(
      table,
      where: 'id IN ($placeholders)',
      whereArgs: ids.toList(),
    );
    return {
      for (final map in result)
        (map['id'] as int): CaffeineItemModel.fromMap(map),
    };
  }

  @override
  Future<void> deleteRecord(int id) {
    // TODO: implement deleteRecord
    throw UnimplementedError();
  }
}
