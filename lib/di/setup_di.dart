import 'package:fruity/data/local/datasource/cart_datasource.dart';
import 'package:fruity/di/module/sqflite.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingletonAsync<Database>(() => getDatabase());

// Alternatively you could write it if you don't like global variables
  getIt.registerSingleton<CartDataSource>(
      CartDataSource(db: await getIt.getAsync<Database>()));

  getIt.registerSingleton<CartStore>(CartStore(getIt.get<CartDataSource>()));
}
