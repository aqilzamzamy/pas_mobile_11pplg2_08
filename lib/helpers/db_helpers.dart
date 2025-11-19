// lib/helper/db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites_tvshows.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            name TEXT,
            image TEXT,
            rating REAL
          )
        ''');
      },
    );
  }

  Future<void> addFavorite({
    required int id,
    required String name,
    required String image,
    required double rating,
  }) async {
    final dbClient = await db;
    await dbClient.insert('favorites', {
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(int id) async {
    final dbClient = await db;
    await dbClient.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final dbClient = await db;
    return await dbClient.query('favorites', orderBy: 'id DESC');
  }
}
