import 'package:caffeine_tracker/core/db/local_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncService {
  final _supabase = Supabase.instance.client;
  final _localDb = LocalDataBase();

  Future<void> versionCheck() async {
    try {
      // supbase version
      final remote = await _supabase
          .from('data_version')
          .select('version')
          .single();
      final remoteVersion = remote['version'] as int;

      // local version
      final db = await _localDb.database;
      final localVersionResult = await db.query('data_version');
      final localVersion = localVersionResult.first['version'] as int;

      if (remoteVersion == localVersion) return;
      await _fetch(db);

      await db.update(
        'data_version',
        {'version': remoteVersion},
        where: 'id = ?',
        whereArgs: [1],
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> _fetch(Database db) async {
    final remoteProducts = await _supabase.from('products').select();

    await db.transaction((txn) async {
      // hits 백업
      final existingItems = await txn.query(
        'caffeine_items_from_supabase',
        columns: ['id', 'hits'],
      );
      final hitsMap = {
        for (final item in existingItems)
          item['id'] as int: item['hits'] as int,
      };

      // 삭제
      await txn.delete('caffeine_items_from_supabase');

      // 삽입 (hits 복원)
      final batch = txn.batch();
      for (final product in remoteProducts) {
        batch.insert('caffeine_items_from_supabase', {
          'id': product['id'],
          'category_id': product['category_id'],
          'name': product['name'],
          'brand': product['brand'],
          'service_size': product['size_label'] ?? '',
          'volume_ml': product['volume_ml'],
          'caffeine_amount': product['caffeine_mg'],
          'is_custom': 0,
          'hits': hitsMap[product['id']] ?? 0, // 기존 hits 복원
        });
      }
      await batch.commit(noResult: true);
    });
  }
}
