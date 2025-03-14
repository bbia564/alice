import 'package:expected_date/db_expected/expected_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBExpected extends GetxService {
  late Database dbBase;

  Future<DBExpected> init() async {
    await createExpectedDB();
    return this;
  }

  createExpectedDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'expected.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createExpectedTable(db);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('expectedTime',
          DateTime.now().add(const Duration(days: 40 * 7)).toIso8601String());
    });
  }

  createExpectedTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS expected (id INTEGER PRIMARY KEY, createdTime TEXT, writeTime TEXT, content TEXT)');
  }

  insertExpected(ExpectedEntity entity) async {
    final id = await dbBase.insert('expected', {
      'createdTime': entity.createdTime.toIso8601String(),
      'writeTime': entity.writeTime.toIso8601String(),
      'content': entity.content,
    });
    return id;
  }

  cleanExpectedData() async {
    await dbBase.delete('expected');
  }

  Future<List<ExpectedEntity>> getExpectedAllData() async {
    var result = await dbBase.query('expected', orderBy: 'createdTime DESC');
    return result.map((e) => ExpectedEntity.fromJson(e)).toList();
  }

  Future<List<ExpectedEntity>> getWriteTimeAllData(DateTime today) async {
    var result = await dbBase.query('expected', orderBy: 'createdTime DESC');
    return result
        .map((e) => ExpectedEntity.fromJson(e))
        .toList()
        .where((e) =>
            e.writeTime.year == today.year &&
            e.writeTime.month == today.month &&
            e.writeTime.day == today.day)
        .toList();
  }
}
