import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/ui/cart/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class ListCartItem extends StatelessWidget {
  const ListCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartStore _cartStore = context.read<CartStore>();

    return Observer(builder: (_) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                height: 1,
              ),
            ),
            shrinkWrap: true,
            itemCount: _cartStore.items.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItemWidget(
                item: _cartStore.items[index],
              );
            },
          ));
    });
  }
}
