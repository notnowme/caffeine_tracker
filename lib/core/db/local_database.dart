import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  static final LocalDataBase _instance = LocalDataBase._internal();
  factory LocalDataBase() => _instance;
  LocalDataBase._internal();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'caffeine_tracker.db');

    return await openDatabase(
      path,
      version: 6,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      // 외래키 활성화
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // 정보
    await db.execute('''
CREATE TABLE info (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      weight REAL,
      gender INTEGER,
      smoking INTEGER,
      sense INTEGER,
      target REAL
    )
  ''');

    // 카페인 제품 테이블
    await db.execute('''
  CREATE TABLE caffeine_items_from_supabase (
    id INTEGER PRIMARY KEY,
    category_id INTEGER,
    name TEXT NOT NULL,
    brand TEXT,
    service_size TEXT DEFAULT '',
    volume_ml REAL,
    caffeine_amount REAL DEFAULT 0.0,
    is_custom INTEGER DEFAULT 0,
    hits INTEGER DEFAULT 0
  )
''');
    await db.execute('''
  CREATE TABLE caffeine_items_from_local (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER,
    name TEXT NOT NULL,
    brand TEXT,
    service_size TEXT DEFAULT '',
    volume_ml REAL,
    caffeine_amount REAL DEFAULT 0.0,
    is_custom INTEGER DEFAULT 1,
    hits INTEGER DEFAULT 0
  )
''');

    // 섭취 기록 테이블
    await db.execute('''
  CREATE TABLE drink_records (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    supabase_item_id INTEGER,
    local_item_id INTEGER,
    caffeine_amount REAL NOT NULL,
    is_custom INTEGER,
    drink_at TEXT NOT NULL,
    FOREIGN KEY (local_item_id)
      REFERENCES caffeine_items_from_local(id)
      ON DELETE CASCADE
  )
''');

    // 로컬 DB 버전 테이블 (Supabase 동기화용)
    await db.execute('''
      CREATE TABLE data_version (
        id INTEGER PRIMARY KEY DEFAULT 1,
        version INTEGER DEFAULT 0
      )
    ''');

    await db.insert('data_version', {'id': 1, 'version': 0});
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 6) {
      await db.execute('DROP TABLE IF EXISTS drink_records');
      await db.execute('''
      CREATE TABLE drink_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        supabase_item_id INTEGER,
        local_item_id INTEGER,
        caffeine_amount REAL NOT NULL,
        is_custom INTEGER,
        drink_at TEXT NOT NULL,
        FOREIGN KEY (local_item_id)
          REFERENCES caffeine_items_from_local(id)
          ON DELETE CASCADE
      )
    ''');
    }
  }
}
