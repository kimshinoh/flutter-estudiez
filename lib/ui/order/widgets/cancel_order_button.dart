import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/stores/order/order_detail_store.dart';
import 'package:provider/provider.dart';

class ButtonOrderCancel extends StatelessWidget {
  const ButtonOrderCancel({Key? key}) : super(key: key);

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Bạn có chắc chắn muốn hủy đơn hàng?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          content: const TextField(
              decoration: InputDecoration(
            labelText: 'Lý do hủy',
          )),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OrderDetailStore _orderDetailStore = context.read<OrderDetailStore>();

    return Observer(
      builder: (_) {
        Order? order = _orderDetailStore.order;
        if (order == null) {
          return SizedBox.shrink();
        }
        if (order.status != 'processing') {
          return SizedBox.shrink();
        }

        return SizedBox(
          height: 60,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Observer(
                    builder: (_) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () async {
                          _showConfirmDialog(context);
                        },
                        child: Observer(builder: (_) {
                          return _orderDetailStore.isLoading
                              ? const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Hủy đơn hàng',
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
      },
    );
  }
}
