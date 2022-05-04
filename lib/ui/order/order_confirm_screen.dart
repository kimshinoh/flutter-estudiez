import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/order/widgets/create_order_button.dart';
import 'package:fruity/ui/order/widgets/list_cart_item.dart';
import 'package:fruity/ui/order/widgets/select_received_time.dart';
import 'package:fruity/ui/order/widgets/seller_info_widget.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/payment_user_widget.dart';
import 'package:fruity/widgets/user_address_widget.dart';
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
    final ConfirmOrderAgruments args =
        ModalRoute.of(context)!.settings.arguments as ConfirmOrderAgruments;

    String sellerId = args.sellerId;
    OrderConfirmationStore _orderConfirmationStore = OrderConfirmationStore();
    _orderConfirmationStore.createOrderStore.setupUpdateAddress();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xác nhận đơn hàng'),
          centerTitle: true,
        ),
        bottomNavigationBar: Provider(
            create: (_) => _orderConfirmationStore,
            child: const ButtonCreateOrder()),
        body: Provider(
          create: (_) => _orderConfirmationStore,
          child: _body(sellerId: sellerId),
        ));
  }
}

class _body extends StatelessWidget {
  String sellerId;
  _body({Key? key, required this.sellerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      final CartStore cartStore = context.read<CartStore>();
      final AuthStore authStore = context.read<AuthStore>();

      final List<CartItem>? items = cartStore.groupedItemsBySeller[sellerId];

      final OrderConfirmationStore _orderConfirmationStore =
          context.read<OrderConfirmationStore>();
      if (items != null) {
        _orderConfirmationStore.createOrderStore.setItems(items);
      }

      _orderConfirmationStore.createOrderStore.setSellerId(sellerId);

      final Payment? defaultPayment = authStore.paymentStore.defaultPayment;

      if (defaultPayment != null) {
        _orderConfirmationStore.createOrderStore.setPayment(defaultPayment);
      }
      Seller? seller = cartStore.sellerStore.sellersMap[sellerId];

      if (seller != null) {
        _orderConfirmationStore.createOrderStore.setSeller(seller);
      }

      if (authStore.userAddressStore.defaultAddress != null) {
        _orderConfirmationStore.createOrderStore
            .setAddress(authStore.userAddressStore.defaultAddress);
      }

      return ListView(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  Observer(builder: (_) {
                    _orderConfirmationStore.createOrderStore
                        .setAddress(authStore.userAddressStore.defaultAddress);
                    return const UserAddressWidget();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const SelectReceivedTime()
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
                  if (seller != null)
                    SellerInfoWidget(seller: seller)
                  else
                    Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ListCartItem(),
                  const SizedBox(
                    height: 20,
                  ),
                  const _PriceInfo(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: _NoteInfo(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: PaymentSelectionWidget(),
            ),
          ),
        ],
      );
    }
  }
}

class _PriceInfo extends StatelessWidget {
  const _PriceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderConfirmationStore _orderConfirmationStore =
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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                '${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.itemsPrice, removeDecimal: true)} ₫',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Observer(builder: (_) {
                  return Text(
                    'Phí giao hàng (${_orderConfirmationStore.createOrderStore.distance} km)',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  );
                }),
              ),
              Observer(builder: (_) {
                return Text(
                  '${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.shippingFee, removeDecimal: true)} ₫',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Tổng tiền',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                '${CurrencyHelper.withCommas(value: _orderConfirmationStore.createOrderStore.totalPrice, removeDecimal: true)} ₫',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NoteInfo extends StatelessWidget {
  const _NoteInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    final TextEditingController _noteController = TextEditingController(
      text: _orderConfirmationStore.createOrderStore.note,
    );
    return Row(
      children: [
        const Text(
          'Ghi chú',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            child: TextFormField(
              controller: _noteController,
              textAlign: TextAlign.end,
              maxLines: 2,
              onChanged: (String value) {
                _orderConfirmationStore.createOrderStore.setNote(value);
              },
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                hintText: 'Nhắn cho người bán',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
