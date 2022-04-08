import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  Color badgeColor;
  Color iconColor;
  int iconSize;

  CartButton({
    Key? key,
    this.badgeColor = Colors.white,
    this.iconColor = Colors.white,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartStore _cartStore = context.read<CartStore>();

    return Observer(builder: (_) {
      return IconButton(
        icon: Badge(
          showBadge: _cartStore.items.isNotEmpty,
          badgeColor: badgeColor,
          badgeContent: _cartStore.items.isNotEmpty
              ? Text(
                  _cartStore.items.length.toString(),
                  style: const TextStyle(color: Colors.white),
                )
              : null,
          child: Icon(
            Icons.local_mall_outlined,
            color: iconColor,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.cart);
        },
      );
    });
  }
}
