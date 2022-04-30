import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/ui/order/order_detail_screen.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/widgets/seller_logo.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.view_order,
            arguments: OrderDetailAgruments(order.id));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Đơn hàng: ${order.textId}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          order.statusText,
                          style:
                              TextStyle(fontSize: 14, color: order.statusColor),
                        ),
                        const SizedBox(width: 5),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: order.statusColorOverlay,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: order.statusColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: 10,
                                height: 10,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SellerLogo(
                              size: const Size(40, 40),
                              logoUrl: order.seller.logo),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                order.seller.name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      DateTimeHelper.formatDate(
                          order.createdAt, "hh:mm - dd/MM/yyyy"),
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Wrap(
                  children: [
                    for (final OrderItem orderItem in order.orderItems)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                            child: Image(
                                width: 40,
                                height: 40,
                                image:
                                    NetworkImage(orderItem.product.imageUrl))),
                      )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tổng tiền: ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '${CurrencyHelper.withCommas(value: order.totalPrice, removeDecimal: true)} ₫',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.palette.shade600,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  ElevatedButton(
                      onPressed: () {
                        _showReOrderBottomSheet(context, order);
                      },
                      child: Text('Mua lại'))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

void _showReOrderBottomSheet(BuildContext context, Order order) {
  showModalBottomSheet<void>(
    // border top corner
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),

    // close button in top right corn

    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: _reOrderForm(
          order: order,
        ),
      );
    },
  );
}

class _reOrderForm extends StatelessWidget {
  Order order;
  _reOrderForm({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartStore _cartStore = context.read<CartStore>();
    return Wrap(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SellerLogo(size: Size(40, 40), logoUrl: order.seller.logo),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    order.seller.name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              OrderItem orderItem = order.orderItems[index];
              return _reOrderItem(orderItem: orderItem);
            },
            itemCount: order.orderItems.length),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        const Divider(
          thickness: 1,
          height: 1,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () async {
                    List<CartItem> cartItems = [];
                    for (final OrderItem orderItem in order.orderItems) {
                      cartItems.add(orderItem.toCartItem());
                    }

                    await _cartStore.addItems(cartItems);
                    Navigator.popAndPushNamed(context, Routes.cart);
                  },
                  child: _cartStore.isLoading
                      ? SizedBox(
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          width: 15,
                          height: 15,
                        )
                      : const Text(
                          'Thêm vào giỏ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                );
              }),
            ),
          ),
        ),
        Container(height: 20),
      ],
    );
  }
}

class _reOrderItem extends StatelessWidget {
  OrderItem orderItem;
  _reOrderItem({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  orderItem.product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderItem.product.name.trim(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(orderItem.product.unit ?? "",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    Text(CurrencyHelper.withCommas(
                            value: orderItem.product.price,
                            removeDecimal: true) +
                        "₫")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
