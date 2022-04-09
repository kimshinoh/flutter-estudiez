import 'package:flutter/material.dart';
import 'package:fruity/ui/cart/widgets/list_cart_item.dart';
import 'package:fruity/widgets/user_address.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Giỏ hàng'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              UserAddress(),
              SizedBox(
                height: 10,
              ),
              ListCartItem()
            ],
          ),
        ));
  }
}
