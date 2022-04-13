import 'package:flutter/material.dart';
import 'package:fruity/ui/order/widgets/select_received_time.dart';
import 'package:fruity/widgets/user_address.dart';

class ConfirmOrderAgruments {
  final String sellerId;
  ConfirmOrderAgruments({required this.sellerId});
}

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ConfirmOrderAgruments;
    print(args.sellerId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận đơn hàng'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserAddress(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectReceivedTime(),
            )
          ],
        ),
      ),
    );
  }
}
