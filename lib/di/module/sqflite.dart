import 'package:fruity/data/local/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), DBConstants.DB_NAME),
    // When the database is first created, create a table to store dogs.
    onCreate: (Database db, int version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        '''
      CREATE TABLE IF NOT EXISTS cart (
        id TEXT PRIMARY KEY,
        productId TEXT,
        name TEXT,
        price REAL,
        imageUrl TEXT,
        unit TEXT,
        quantity INTEGER
      )
    ''',
      );
    },
    version: 1,
  ).catchError((e) {
    print(e);
  });

  return db;
}
