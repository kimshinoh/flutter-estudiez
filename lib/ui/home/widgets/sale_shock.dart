import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/stores/category/product_store.dart';
import 'package:fruity/ui/product/widgets/product_horizon.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/rediant-gradient.dart';
import 'package:provider/provider.dart';

class SaleShock extends StatefulWidget {
  const SaleShock({Key? key}) : super(key: key);
  @override
  _SaleShockState createState() => _SaleShockState();
}

class _SaleShockState extends State<SaleShock> {
  late ProductStore _productStore;
  @override
  void initState() {
    _productStore = context.read<ProductStore>();
    _productStore.getProductsSaleShock(3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '💰 SALE SHOCK',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: const <Widget>[
                  Text(
                    'Xem thêm',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Siêu ưu đãi, giá cực shock chỉ từ 1k',
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 124, 124, 124),
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _productStore.productsSaleShock.length,
            itemBuilder: (BuildContext context, int index) {
              final Product _product = _productStore.productsSaleShock[index];
              return InkWell(
                  onTap: () {},
                  child: ProductHorizon(
                    imageLink: _product.imageUrl,
                    name: _product.name,
                    price: _product.price,
                    sellerName: "Chúa mới bít",
                    sold: 55,
                    unit: _product.unit!,
                  ));
            },
          )
        ],
      ),
    );
  }
}
