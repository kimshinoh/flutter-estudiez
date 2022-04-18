import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/widgets/badget_decoration.dart';
import 'package:provider/provider.dart';

class PaymentSelectionWidget extends StatelessWidget {
  const PaymentSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = context.read<AuthStore>();
    OrderConfirmationStore _orderConfirmationStore =
        context.read<OrderConfirmationStore>();

    bool isSelected(Payment payment) {
      Payment? selectedPayment =
          _orderConfirmationStore.createOrderStore.payment;

      return selectedPayment != null &&
          selectedPayment.provider == payment.provider;
    }

    return Observer(builder: (BuildContext context) {
      final Payment? selectedPayment =
          _orderConfirmationStore.createOrderStore.payment;

      if (_authStore.isLoggedIn) {
        return Row(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        _orderConfirmationStore.createOrderStore.setPayment(
                            _authStore.paymentStore.defaultPayment!);
                      },
                      child: Container(
                        foregroundDecoration:
                            isSelected(_authStore.paymentStore.defaultPayment!)
                                ? BadgeDecoration(
                                    badgeColor: AppColors.palette.shade500,
                                    badgeSize: 25,
                                    textSpan: TextSpan(),
                                  )
                                : null,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: isSelected(
                                    _authStore.paymentStore.defaultPayment!)
                                ? AppColors.palette.shade500
                                : Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _authStore.paymentStore.defaultPayment!
                                    .paymentWidget(),
                                const SizedBox(width: 10),
                                Text(
                                  _authStore.paymentStore.defaultPayment!.name,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Icon(Icons.done, size: 12, color: Colors.white),
                      top: 0,
                      right: 0,
                    ),
                  ],
                )),
          ],
        );
      } else {
        return Text('Đăng nhập để thực hiện giao dịch');
      }
    });
  }
}
