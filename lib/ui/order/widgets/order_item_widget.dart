import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/widgets/seller_logo.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                              image: NetworkImage(orderItem.product.imageUrl))),
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
                ElevatedButton(onPressed: () {}, child: Text('Mua lại'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
