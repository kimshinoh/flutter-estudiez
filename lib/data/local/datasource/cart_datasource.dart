import 'package:fruity/models/cart/cart.dart';
import 'package:sqflite/sqflite.dart';

class CartDataSource {
  Database db;
  CartDataSource({required this.db});

  Future<Cart> getAll() async {
    final Cart cart = Cart();
    final List<Map<String, dynamic>> maps =
        await db.query('cart').catchError((err) {});

    for (final Map<String, dynamic> map in maps) {
      cart.items.add(CartItem.fromJson(map));
    }
    return cart;
  }

  Future<void> insert(CartItem item) async {
    await db.insert(
      'cart',
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(CartItem item) async {
    await db
        .update('cart', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> delete(CartItem item) async {
    await db.delete('cart', where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> deleteMany(List<CartItem> items) async {
    Future.any(items.map((CartItem item) => delete(item)));
  }

  Future<void> deleteAll() async {
    await db.delete('cart');
  }
}
