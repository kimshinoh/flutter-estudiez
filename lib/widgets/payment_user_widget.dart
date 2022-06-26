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
    List<Payment> payments = _authStore.paymentStore.payments;
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
        return ListView.builder(
            itemCount: payments.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              _orderConfirmationStore.createOrderStore
                                  .setPayment(payments[index]);
                            },
                            child: Container(
                              foregroundDecoration: isSelected(payments[index])
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
                                  color: isSelected(payments[index])
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
                                      payments[index].paymentWidget(),
                                      const SizedBox(width: 10),
                                      Text(
                                        payments[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            child:
                                Icon(Icons.done, size: 12, color: Colors.white),
                            top: 0,
                            right: 0,
                          ),
                        ],
                      )),
                ],
              );
            });
      } else {
        return Text('Đăng nhập để thực hiện giao dịch');
      }
    });
  }
}
