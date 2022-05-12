import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:provider/provider.dart';

class ButtonCreateOrder extends StatelessWidget {
  const ButtonCreateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();
    final CartStore _cartStore = context.read<CartStore>();
    final AuthStore _authStore = context.read<AuthStore>();

    return SizedBox(
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Observer(
                builder: (_) {
                  UserAddress? address =
                      _authStore.userAddressStore.defaultAddress;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _orderConfirmationStore
                                  .createOrderStore.canCreateOrder &&
                              address != null
                          ? AppColors.palette.shade500
                          : Colors.grey,
                    ),
                    onPressed: () async {
                      if (_orderConfirmationStore
                              .createOrderStore.canCreateOrder &&
                          address != null) {
                        await _orderConfirmationStore.createOrderStore
                            .createOrder(address);
                        if (_orderConfirmationStore
                                .createOrderStore.errorMessage !=
                            null) {
                          NotifyHelper.error(
                              context,
                              _orderConfirmationStore
                                      .createOrderStore.errorMessage ??
                                  '');
                          return;
                        }

                        await _cartStore.removeItems(
                          _orderConfirmationStore.createOrderStore.items,
                        );
                        _orderConfirmationStore.createOrderStore.clear();

                        Navigator.popAndPushNamed(context, Routes.orders);
                        Future.delayed(Duration.zero, () {
                          NotifyHelper.success(
                              context, 'Tạo đơn hàng thành công!');
                        });
                      }
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                    }),
                  );
                },
              )),
        ),
      ),
    );
  }
}
