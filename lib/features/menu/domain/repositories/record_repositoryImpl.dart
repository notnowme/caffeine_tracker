import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:caffeine_tracker/features/menu/data/models/caffeine_model.dart';
import 'package:caffeine_tracker/features/menu/data/repositories/record_repository.dart';
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
    await db.rawUpdate('UPDATE $table SET hits = hits + 1 WHERE id = ?', [
      record.id,
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

    return await Future.wait(
      records.map((record) async {
        final item = await getItemById(
          isCustom: record.isCustom,
          id: record.isCustom ? record.localItemId! : record.supabaseItemId!,
        );
        return DrinkRecordWithItem(record: record, item: item);
      }),
    );
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
    return await Future.wait(
      records.map((record) async {
        final item = await getItemById(
          isCustom: record.isCustom,
          id: record.isCustom ? record.localItemId! : record.supabaseItemId!,
        );
        return DrinkRecordWithItem(record: record, item: item);
      }),
    );
  }

  @override
  Future<void> deleteRecord(int id) {
    // TODO: implement deleteRecord
    throw UnimplementedError();
  }
}
