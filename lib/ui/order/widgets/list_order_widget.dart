import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/stores/order/orders_store.dart';
import 'package:fruity/ui/order/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

class OrderListWidget extends StatelessWidget {
  bool isProcessing;
  OrderListWidget({Key? key, required this.isProcessing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrdersStore _ordersStore = context.read<OrdersStore>();

    return Observer(
      builder: (_) {
        List<Order> orders = [];
        if (isProcessing) {
          orders = _ordersStore.processingOrders;
        } else {
          orders = _ordersStore.completedOrders;
        }

        if (_ordersStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (orders.isEmpty) {
            return const EmptyOrders();
          } else {
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final Order order = orders[index];

                  return OrderItemWidget(order: order);
                },
                itemCount: orders.length);
          }
        }
      },
    );
  }
}

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/images/empty_order.png'),
            width: MediaQuery.of(context).size.width * 0.7,
            fit: BoxFit.cover,
          ),
          const Text(
            'Đơn hàng trống',
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
