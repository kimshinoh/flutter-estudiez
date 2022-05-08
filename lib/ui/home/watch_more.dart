import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/category/product_store.dart';
import 'package:fruity/ui/product/product_detail_screen.dart';
import 'package:fruity/ui/product/widgets/product_horizon.dart';
import 'package:fruity/widgets/cart_button.dart';
import 'package:provider/provider.dart';

class WatchMore extends StatefulWidget {
  final String type;
  const WatchMore({Key? key, required this.type}) : super(key: key);

  @override
  _WatchMoreState createState() => _WatchMoreState();
}

class _WatchMoreState extends State<WatchMore> {
  final ProductStore _productStore = ProductStore();
  final Map<String, String> types = {
    'top': 'Top sản phẩm',
    'off': 'Sale Off',
    'shock': 'Sale Shock'
  };
  @override
  void initState() {
    if (widget.type == 'top') {
      _productStore.getProductsTopSale(50);
    } else if (widget.type == 'off') {
      _productStore.getProductsSaleOff(50);
    } else if (widget.type == 'shock') {
      _productStore.getProductsSaleShock(50);
    }
    super.initState();
  }

  @override
  void dispose() {
    _productStore.disposeBig();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(types[widget.type]!),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          elevation: 0,
          actions: [
            CartButton(
              badgeColor: Colors.red,
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Observer(
                builder: (_) => SingleChildScrollView(
                    child: _productStore.loading
                        ? Container(
                            height: height,
                            margin: const EdgeInsets.only(top: 20),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : _buildListProducts())),
          ),
        ));
  }

  Widget _buildListProducts() {
    List<Product> products = [];
    if (widget.type == 'top') {
      products = _productStore.productsTopSaleBig;
    } else if (widget.type == 'off') {
      products = _productStore.productsSaleOffBig;
    } else if (widget.type == 'shock') {
      products = _productStore.productsSaleShockBig;
    }
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final Product _product = products[index];
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.product_detail,
                  arguments: ProductDetailAgruments(_product.id));
            },
            child: ProductHorizon(
              product: _product,
            ));
      },
    );
  }
}
