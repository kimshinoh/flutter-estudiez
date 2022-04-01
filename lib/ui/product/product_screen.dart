import 'package:flutter/material.dart';
import 'package:fruity/ui/product/widgets/category_carousel.dart';
import 'package:fruity/ui/product/widgets/header_product_screen.dart';
import 'package:fruity/ui/product/widgets/subcategory_carousel.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProductScreenAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CategoryCarousel(),
              Row(
                children: [
                  SubcategoryCarousel(),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SubcategoryCarousel(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
