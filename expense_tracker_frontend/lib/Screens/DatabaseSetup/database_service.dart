import 'package:expense_tracker_frontend/Screens/DatabaseSetup/main_dataDB.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 10, onCreate: create, onUpgrade: onUpgradeCreate, singleInstance: true);
    return database;
  }

  Future<void> onUpgradeCreate(
      Database database, int version, int newVersion) async {
    if (newVersion > version) MainDataDB().createTables(database);
  }

  Future<void> create(Database database, int version) async =>
      MainDataDB().createTables(database);

  Future<String> get fullPath async {
    const name = "main_data.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }
}
