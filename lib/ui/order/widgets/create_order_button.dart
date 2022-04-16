import 'package:flutter/material.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:provider/provider.dart';

class ButtonCreateOrder extends StatelessWidget {
  const ButtonCreateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    final CartStore _cartStore = context.read<CartStore>();

    return SizedBox(
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                await _orderConfirmationStore.createOrderStore.createOrder();
                await _cartStore.removeItems(
                  _orderConfirmationStore.createOrderStore.items,
                );
                Future.delayed(Duration.zero, () {
                  NotifyHelper.success(context, 'Tạo đơn hàng thành công!');
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Xác nhận',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
