import 'package:fruity/data/local/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), DBConstants.DB_NAME);
  // await deleteDatabase(path);

  final Database db = await openDatabase(
    join(path),
    // When the database is first created, create a table to store dogs.

    onCreate: (Database db, int version) async {
      // Run the CREATE TABLE statement on the database.
      await db.execute(
        '''
      CREATE TABLE IF NOT EXISTS cart (
        id TEXT PRIMARY KEY,
        productId TEXT,
        name TEXT,
        price REAL,
        imageUrl TEXT,
        unit TEXT,
        quantity INTEGER,
        sellerId TEXT
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
