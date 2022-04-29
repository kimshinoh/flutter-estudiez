import 'package:flutter/material.dart';
import 'package:fruity/stores/order/orders_store.dart';
import 'package:fruity/ui/order/widgets/list_order_widget.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late OrdersStore _ordersStore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _ordersStore = OrdersStore();

    Future.any([
      _ordersStore.getMyOrders(''),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Đơn hàng'),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Đang xử lý',
              ),
              Tab(
                text: 'Lịch sử đơn',
              ),
            ],
          ),
        ),
        body: Provider(
          create: (BuildContext context) => _ordersStore,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              OrderListWidget(isProcessing: true),
              OrderListWidget(isProcessing: false),
            ],
          ),
        ));
  }
}
