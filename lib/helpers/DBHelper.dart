import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {

  static Future<sql.Database> database()async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, "places.db"),
        version: 1, onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT , image TEXT)");
        });
  }
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final sqlDB = await DBHelper.database();
    await sqlDB.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

}
