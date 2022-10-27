import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/sqlite_datasources.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDatasourceImpl implements SqliteDatasource {
  final String CREATE_CAR_OCCURENCY_TABLE_SCRIPT =
      "CREATE TABLE CarOccurency(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, tag TEXT, datetime DATETIME)";

  @override
  Future<void> createCarOccurency(CarOccurencyInput carOccurrency) async {
    try {
      final Database db = await _getDatabase();

      final x = {
        'tag': carOccurrency.tag,
        'datetime': carOccurrency.datetime.toString(),
      };

      await db.insert('CarOccurency', x);
    } catch (ex) {
      print(ex);
      return;
    }
  }

  @override
  Future<List<CarOccurencyEntity>> listCarOccurency(DateTime dateFilter) async {
    final Database db = await _getDatabase();

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT id, tag, datetime FROM CarOccurency WHERE datetime =?',
        [dateFilter.toString()]);

    // final List<Map<String, dynamic>> maps = await db.query('CarOccurency',
    //     where: 'datetime = ${dateFilter.toString()}');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return CarOccurencyEntity(
        id: maps[i]['id'],
        tag: maps[i]['tag'],
        datetime: DateTime.parse(maps[i]['datetime']),
      );
    });
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'greenwave.db'),
      onCreate: (db, version) {
        return db.execute(CREATE_CAR_OCCURENCY_TABLE_SCRIPT);
      },
      version: 1,
    );
  }
}
