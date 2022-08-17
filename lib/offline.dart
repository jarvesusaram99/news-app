import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static List dataList = [];

  static String columnId = 'id';

  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'thecart.db'),
        onCreate: (db, version) {
      return db
          .execute('CREATE TABLE thecart(id TEXT PRIMARY KEY, heading TEXT, date TEXT,image TEXT, description TEXT, authorr TEXT)');
      //'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT,loc_lat REAL, loc_lng REAL, address TEXT)'
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    print('inserted');
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<int> delete(int id) async {
    final db = await DBHelper.database();
    return db.delete('thecart', where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<int> fulldelete() async {
    final db = await DBHelper.database();
    return db.delete('thecart', where: null, whereArgs: null);
    //    return db.delete('thecart', where: '$columnId = ?', whereArgs: [id]);
  }
  //  Future<int> update() async {
  //     final db = await DBHelper.database();
  //   return await db.update('thecart', todo.toMap(),
  //       where: '$columnId = ?', whereArgs: [id]);
  // }

  static Future<int> updateData(Map<String, Object> data, int id) async {
    final db = await DBHelper.database();
    var result = await db
        .update('thecart', data, where: '$columnId = ?', whereArgs: [id]);
    return result;
  }

  // Future<Todo> insert(Todo todo) async {
  //   todo.id = await db.insert(tableTodo, todo.toMap());
  //   return todo;
  // }
 

}
