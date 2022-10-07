import 'package:fruity/data/local/datasource/search_history_datasource.dart';
import 'package:fruity/di/module/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDI() async {
  final Database db = await getDatabase();

  getIt.registerSingleton<Database>(db);

// Alternatively you could write it if you don't like global variables

  getIt.registerSingleton<SearchHistoryDataSource>(
    SearchHistoryDataSource(db: getIt.get<Database>()),
  );

}
