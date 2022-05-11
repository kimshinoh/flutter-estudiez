import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/stores/product/product_detail_store.dart';
import 'package:fruity/widgets/add_to_cart_button.dart';
import 'package:provider/provider.dart';

class AddToCartBottomBar extends StatelessWidget {
  const AddToCartBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailStore _productDetailStore = context.read<ProductDetailStore>();

    return Observer(
      builder: (_) {
        Product? product = _productDetailStore.product;
        if (product == null) {
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
                        onPressed: () async {
                          addToCart(context, product);
                        },
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 30,
                        ),
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
