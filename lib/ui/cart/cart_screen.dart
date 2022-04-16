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
    CartStore _cartStore = context.read<CartStore>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Giỏ hàng'),
        ),
        body: Observer(builder: (context) {
          return _cartStore.items.isEmpty
              ? _cartEmpty()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      UserAddressWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      ListCartItem()
                    ],
                  ),
                );
        }));
  }
}

Widget _cartEmpty() {
  return Builder(builder: (context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/empty_cart.png'),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.cover,
          ),
          Text(
            'Giỏ hàng trống',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Mua sắm ngay'),
            ),
          ),
        ],
      ),
    );
  });
}
