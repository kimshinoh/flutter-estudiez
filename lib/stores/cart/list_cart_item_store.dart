import 'package:fruity/models/cart/cart.dart';
import 'package:mobx/mobx.dart';
part 'list_cart_item_store.g.dart';

class ListCartItemStore = ListCartItemStoreBase with _$ListCartItemStore;

abstract class ListCartItemStoreBase with Store {
  @observable
  List<CartItem> items = [];
}
