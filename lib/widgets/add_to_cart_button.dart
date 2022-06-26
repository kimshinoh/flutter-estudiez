import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/stock/stock.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/stock/stock_product_store.dart';
import 'package:fruity/ui/order/order_confirm_screen.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fullHeight = MediaQuery.of(context).size.height;
    final CartStore cartStore = context.read<CartStore>();
    return IconButton(
      icon: Icon(
        Icons.add_circle,
        size: 30,
        color: AppColors.palette.shade500,
      ),
      onPressed: () {
        addToCart(context, product);
      },
    );
  }
}

void addToCart(BuildContext context, Product product) {
  final CartStore cartStore = context.read<CartStore>();
  showModalBottomSheet<void>(
    // border top corner
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),

    isScrollControlled: true,
    context: context,

    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: _AddToCartForm(product: product),
      );
    },
  ).whenComplete(() => cartStore.cleanQty());
}

class _AddToCartForm extends StatelessWidget {
  final Product product;
  _AddToCartForm({Key? key, required this.product}) : super(key: key);
  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = context.read<CartStore>();
    _controller = TextEditingController(
      text: _cartStore.qty.toString(),
    );
    final stockProductStore = StockProductStore();
    stockProductStore.getStockByProductId(product.id);
    return Provider(
        create: (_) => stockProductStore,
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: const Text(
                  'Chọn số lượng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox.fromSize(
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Observer(builder: (_) {
                          Stock? stock = stockProductStore.stock;
                          if (stock == null) {
                            return const SizedBox();
                          }
                          return Text('Còn lại: ${stock.quantity}');
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Observer(
                builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.unit ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giá: ${CurrencyHelper.withCommas(
                              value: product.price,
                              removeDecimal: true,
                            )} ₫',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.palette.shade500,
                            ),
                          ),
                          Observer(builder: (_) {
                            Stock? stock = stockProductStore.stock;

                            if (stock != null && stock.quantity <= 0) {
                              return const SizedBox();
                            }

                            return Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    size: 24,
                                    color: _cartStore.canDecreaseQuantity
                                        ? AppColors.palette.shade500
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (_cartStore.canDecreaseQuantity) {
                                      _cartStore.decreaseQuantity();
                                      _controller.text =
                                          _cartStore.qty.toString();
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _controller,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    onChanged: (String value) {
                                      _cartStore.validateQuantity(value);
                                      _controller.text =
                                          _cartStore.qty.toString();
                                      _controller.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(
                                            offset: _controller.text.length),
                                      );
                                    },
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  key: const Key('increase_quantity'),
                                  icon: Icon(
                                    Icons.add_circle,
                                    size: 24,
                                    color: _cartStore.canIncreaseQuantity &&
                                            stock != null &&
                                            _cartStore.qty < stock.quantity
                                        ? AppColors.palette.shade500
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (_cartStore.canIncreaseQuantity &&
                                        stock != null &&
                                        _cartStore.qty < stock.quantity) {
                                      _cartStore.increaseQuantity();
                                      _controller.text =
                                          _cartStore.qty.toString();
                                    }
                                  },
                                )
                              ],
                            );
                          }),
                        ],
                      ),
                      if (_cartStore.error.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              _cartStore.error,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                    ],
                  );
                },
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng tiền: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${CurrencyHelper.withCommas(
                          value: _cartStore.qty * product.price,
                          removeDecimal: true,
                        )} ₫',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.palette.shade500,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Observer(builder: (_) {
                final Stock? stock = stockProductStore.stock;

                if (stock != null && stock.quantity <= 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Hết hàng',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  );
                }

                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: OutlinedButton(
                          key: const Key('add_to_cart'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.palette.shade500),
                            primary: AppColors.palette.shade300,
                          ),
                          onPressed: () async {
                            if (_cartStore.canAddToCart) {
                              await _cartStore.addItem(
                                product.toCartItem(quantity: _cartStore.qty),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Thêm vào giỏ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          key: const Key('buy_now_btn'),
                          onPressed: () async {
                            if (_cartStore.canAddToCart) {
                              await _cartStore.addItem(
                                product.toCartItem(quantity: _cartStore.qty),
                              );

                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                Routes.confirm_order,
                                arguments: ConfirmOrderAgruments(
                                  sellerId: product.sellerId,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Mua ngay',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Container(height: 20),
          ],
        ));
  }
}
