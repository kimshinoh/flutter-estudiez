import 'package:flutter/material.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/order/widgets/create_order_button.dart';
import 'package:fruity/ui/order/widgets/list_cart_item.dart';
import 'package:fruity/ui/order/widgets/select_received_time.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/user_address.dart';

import 'package:provider/provider.dart';

class ConfirmOrderAgruments {
  final String sellerId;
  ConfirmOrderAgruments({required this.sellerId});
}

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ConfirmOrderAgruments;

    CartStore cartStore = context.read<CartStore>();
    AuthStore authStore = context.read<AuthStore>();
    List<CartItem>? items = cartStore.groupedItemsBySeller[args.sellerId];
    final Seller? seller = cartStore.sellerStore.sellersMap[args.sellerId];

    OrderConfirmationStore _orderConfirmationStore = OrderConfirmationStore();
    if (items != null) {
      _orderConfirmationStore.createOrderStore.setItems(items);
    }
    if (seller != null) {
      _orderConfirmationStore.createOrderStore.setSeller(seller);
    }
    final UserAddress? userAddress = authStore.userAddressStore.defaultAddress;

    if (userAddress != null) {
      _orderConfirmationStore.createOrderStore.setUserAddress(userAddress);
    }

    return Provider.value(
        value: _orderConfirmationStore,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Xác nhận đơn hàng'),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomAppBar(child: ButtonCreateOrder()),
            body: _body()));
  }

  Widget _body() {
    return Builder(builder: (context) {
      OrderConfirmationStore _orderConfirmationStore =
          context.read<OrderConfirmationStore>();
      return ListView(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  UserAddressWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  SelectReceivedTime()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  _SellerInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  ListCartItem(),
                  SizedBox(
                    height: 20,
                  ),
                  _PriceInfo(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: _NoteInfo(),
            ),
          ),
        ],
      );
    });
  }
}

class _SellerInfo extends StatelessWidget {
  const _SellerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();

    if (_orderConfirmationStore.createOrderStore.seller != null) {
      return Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: ClipOval(
              child: SizedBox.fromSize(
                child: Image.network(
                  _orderConfirmationStore.createOrderStore.seller!.logo,
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
                  _orderConfirmationStore.createOrderStore.seller!.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  _orderConfirmationStore.createOrderStore.seller!.getType(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

class _PriceInfo extends StatelessWidget {
  const _PriceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tổng tiền ${_orderConfirmationStore.createOrderStore.items.length} sản phẩm',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Text(
                  "${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.itemsPrice, removeDecimal: true)} ₫",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Phí giao hàng (${_orderConfirmationStore.createOrderStore.distance} km)',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Text(
                  "${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.feeShipping, removeDecimal: true)} ₫",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tổng tiền',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.totalPrice, removeDecimal: true)} ₫",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade700),
                ),
              ],
            ),
          ],
        ));
  }
}

class _NoteInfo extends StatelessWidget {
  const _NoteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    TextEditingController _noteController = TextEditingController(
        text: _orderConfirmationStore.createOrderStore.note);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ghi chú',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextFormField(
              controller: _noteController,
              textAlign: TextAlign.end,
              maxLines: 2,
              onChanged: (value) {
                _orderConfirmationStore.createOrderStore.setNote(value);
              },
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: 'Nhắn cho người bán',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
