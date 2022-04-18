import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            child: Observer(builder: (_) {
              return ElevatedButton(
                onPressed: () async {
                  await _orderConfirmationStore.createOrderStore.createOrder();
                  await _cartStore.removeItems(
                    _orderConfirmationStore.createOrderStore.items,
                  );
                  _orderConfirmationStore.createOrderStore.clear();

                  Navigator.pop(context);
                  Future.delayed(Duration.zero, () {
                    NotifyHelper.success(context, 'Tạo đơn hàng thành công!');
                  });
                },
                child: Observer(builder: (_) {
                  return _orderConfirmationStore.createOrderStore.isLoading
                      ? const SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Xác nhận',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
