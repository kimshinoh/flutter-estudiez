import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/ui/cart/widgets/list_cart_item.dart';
import 'package:fruity/widgets/user_address.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = context.read<CartStore>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Giỏ hàng'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return _cartStore.items.isEmpty
              ? _cartEmpty()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: const [
                      UserAddressWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      ListCartItem()
                    ],
                  ),
                );
        },
      ),
    );
  }
}

Widget _cartEmpty() {
  return Builder(
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/empty_cart.png'),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            const Text(
              'Giỏ hàng trống',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Mua sắm ngay'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
