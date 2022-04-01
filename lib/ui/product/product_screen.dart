import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/ui/product/widgets/category_carousel.dart';
import 'package:fruity/ui/product/widgets/header_product_screen.dart';
import 'package:fruity/ui/product/widgets/subcategory_carousel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DioClient dio = DioClient(Dio());
    dio.get('/users').then((value) {
      print(value);
    }).catchError((err) {
      print(err.message);
    });
  }

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
