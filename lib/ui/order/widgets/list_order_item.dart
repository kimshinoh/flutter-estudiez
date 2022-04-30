import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/stores/order/order_detail_store.dart';
import 'package:fruity/ui/order/widgets/list_cart_item.dart';
import 'package:provider/provider.dart';

class ListOrderItem extends StatelessWidget {
  ListOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderConfirmationStore =
        context.read<OrderDetailStore>();

    return Observer(builder: (_) {
      final Order? order = _orderConfirmationStore.order;
      if (order != null) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
              height: 1,
            ),
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            OrderItem item = order.orderItems[index];

            return CartItemWidget(
              item: item.toCartItem(),
              isEditting: false,
            );
          },
          itemCount: order.orderItems.length,
        );
      }
      return Container();
    });
  }
}
