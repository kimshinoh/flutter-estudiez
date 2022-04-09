import 'package:collection/collection.dart';
import 'package:fruity/data/local/datasource/cart_datasource.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  late CartDataSource _cartDataSource;

  _CartStoreBase(CartDataSource cartDataSource) {
    _cartDataSource = cartDataSource;
    cartDataSource.getAll().then(
          (Cart value) => {
            items = value.items,
            isLoading = false,
          },
        );
  }

  @observable
  List<CartItem> items = [];

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  int qty = 0;

  @action
  Future<void> addItem(CartItem item) async {
    final CartItem? _existingItem = items.firstWhereOrNull(
      (CartItem cartItem) => cartItem.id == item.id,
    );

    if (_existingItem != null) {
      updateQuantity(item, _existingItem.quantity + item.quantity);
    } else {
      items = items..add(item);
      await _cartDataSource.insert(item);
    }
  }

  @action
  Future<void> updateQuantity(CartItem item, int quantty) async {
    item.quantity = quantty;
    final int index =
        items.indexWhere((CartItem cartItem) => cartItem.id == item.id);
    if (index != -1) {
      items[index] = item;
      items = List<CartItem>.from(items);
      await _cartDataSource.update(item);
    }
  }

  @action
  Future<void> removeItem(CartItem item) async {
    items = items..removeWhere((CartItem element) => element.id == item.id);
    _cartDataSource.delete(item);
  }

  @action
  void validateQuantity(String quantity) {
    if (quantity.isEmpty) {
      qty = 0;
      return;
    }
    qty = int.parse(quantity);

    if (qty > 5) {
      qty = 5;
      error = 'Bạn chỉ có thể mua tối đa 5 sản phẩm trong một đơn hàng';
    } else {
      error = '';
    }
  }

  @action
  void clear() {
    items.clear();
    _cartDataSource.deleteAll();
  }

  @action
  void cleanQty() {
    qty = 0;
  }

  @action
  void decreaseQuantity() {
    error = '';
    if (qty > 0) {
      qty--;
    }
  }

  @action
  void increaseQuantity() {
    qty++;
    if (qty == 5) {
      error = 'Bạn chỉ có thể mua tối đa 5 sản phẩm trong một đơn hàng';
    } else {
      error = '';
    }
  }

  @computed
  bool get canIncreaseQuantity => qty < 5;

  @computed
  bool get canDecreaseQuantity => qty > 0;

  @computed
  bool get canAddToCart => qty > 0;

  @computed
  Map<String, List<CartItem>> get groupedItemsBySeller {
    return groupBy(
      items,
      (CartItem item) => item.sellerId,
    );
  }

  @computed
  Map<String, double> get totalPriceBySeller {
    return groupedItemsBySeller.map((String key, List<CartItem> value) {
      double totalPrice = 0;
      for (final CartItem item in value) {
        totalPrice += item.price * item.quantity;
      }
      return MapEntry(key, totalPrice);
    });
  }
}
