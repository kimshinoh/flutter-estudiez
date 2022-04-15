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
      final Batch batch = db.batch();
      batch.execute('''
      CREATE TABLE IF NOT EXISTS cart (
        id TEXT PRIMARY KEY,
        product_id TEXT,
        name TEXT,
        price REAL,
        image_url TEXT,
        unit TEXT,
        quantity INTEGER,
        seller_id TEXT
      )
      ''');
      batch.execute(
        '''
       CREATE TABLE IF NOT EXISTS search (
          key TEXT PRIMARY KEY
        )
        ''',
      );
      await batch.commit();
    },

    version: 1,
  ).catchError((e) {
    print(e);
  });

  return db;
}
