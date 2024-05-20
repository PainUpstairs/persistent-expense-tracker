import 'package:expense_tracker_frontend/Screens/DatabaseSetup/Model/item.dart';
import 'package:expense_tracker_frontend/Screens/DatabaseSetup/Model/lookup.dart';
import 'package:sqflite/sqflite.dart';
import 'package:expense_tracker_frontend/Screens/DatabaseSetup/database_service.dart';

class MainDataDB {
  final calendarDataTable = "calendarData";
  final lookupTable = "lookup";

  Future<void> createLookupTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $lookupTable(
      "id" INTEGER NOT NULL,
      "name" TEXT NOT NULL ,
      "code" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "isSynced" INTEGER NOT NULL,
      UNIQUE ("name","code"),
      PRIMARY KEY ("id" AUTOINCREMENT)
    );""");
  }

  Future<void> createMainDataTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $calendarDataTable(
      "id" INTEGER NOT NULL,
      "type" TEXT NOT NULL,
      "category" TEXT NOT NULL,
      "name" TEXT NOT NULL,
      "value" TEXT,
      "createdAt" TEXT NOT NULL,
      "isSynced" INTEGER NOT NULL,
      PRIMARY KEY ("id" AUTOINCREMENT)
      );""");
  }

  Future<void> createTables(Database database) async {
    await createLookupTable(database);
    await createMainDataTable(database);
  }

  Future<int> insertMainData(Item item) async {
    final database = await DatabaseService().database;
    return await database.insert(calendarDataTable, item.toMap());
  }

  Future<int> insertLookupData(List<Lookup> lookups) async {
    final database = await DatabaseService().database;
    try {
      Batch batch = database.batch();
      for (var lookup in lookups) {
        batch.insert(lookupTable, lookup.toMap());
      }
      batch.commit(noResult: true);
      return 1;
    } catch (e) {
      return 0;
    }
  }

  Future<List<Item>> fetchAllMainData() async {
    final database = await DatabaseService().database;
    final items =
        await database.query(calendarDataTable, columns: null, where: null);
    return items.map((item) => Item.fromSqfliteDatabase(item)).toList();
  }

  Future<List<Lookup>> fetchAllLookUpData() async {
    final database = await DatabaseService().database;
    final lookups =
        await database.query(lookupTable, columns: null, where: null);
    return lookups.map((lookup) => Lookup.fromSqfliteDatabase(lookup)).toList();
  }

  Future<void> dropTable(String table) async {
    final database = await DatabaseService().database;
    var sqlDropTable = "DROP TABLE $table";
    database.execute(sqlDropTable);
  }
}
