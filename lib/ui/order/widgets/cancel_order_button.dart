import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/order/order.dart';
import 'package:fruity/stores/order/cancel_order_store.dart';
import 'package:fruity/stores/order/order_detail_store.dart';
import 'package:provider/provider.dart';

class ButtonOrderCancel extends StatelessWidget {
  const ButtonOrderCancel({Key? key}) : super(key: key);

  Future<void> _showConfirmDialog(BuildContext context) async {
    final CancelOrderStore _cancelOrderStore = context.read<CancelOrderStore>();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Bạn có chắc chắn muốn hủy đơn hàng?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          content: TextFormField(
              textInputAction: TextInputAction.done,
              onChanged: (String note) {
                _cancelOrderStore.setNote(note);
              },
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
              onPressed: () async {
                Navigator.of(context).pop();
                await _cancelOrderStore.cancelOrder();
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
    final CancelOrderStore _cancelOrderStore = context.read<CancelOrderStore>();
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
                          await _showConfirmDialog(context);

                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pop(context, {
                              'action': 'reload',
                            });
                          });
                        },
                        child: Observer(builder: (_) {
                          return _cancelOrderStore.isLoading
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
