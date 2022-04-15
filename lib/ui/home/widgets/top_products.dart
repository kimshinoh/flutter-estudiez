import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/stores/category/product_store.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class TopProducts extends StatefulWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  _TopProductsState createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {
  late ProductStore _productStore;

  @override
  void initState() {
    _productStore = context.read<ProductStore>();
    _productStore.getProductsTopSale(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.9,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: _buildTopProducts());
  }

  Widget _buildTopProducts() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/hot.png',
                    width: 40,
                  ),
                  GradientText(
                    'Top Sản Phẩm',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade400,
                        Colors.orange.shade900,
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
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
        ),

        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Skeleton(
                isLoading: _productStore.loading,
                skeleton: _TopProductSkeleton(),
                child: _buildListProducts(),
              )),
        ),
        // )
      ],
    );
  }

  Widget _buildListProducts() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _productStore.productsTopSale.length,
      itemBuilder: (BuildContext context, int index) {
        final Product product = _productStore.productsTopSale[index];
        return InkWell(
          onTap: () {},
          child: SizedBox(
            width: 100,
            child: Column(
              children: [
                SizedBox(
                  width: 96,
                  height: 96,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: SizedBox.fromSize(
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            border: Border.all(
                              color: Colors.red,
                              width: 1.2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text(
                              '- ${product.percent.toInt()}%',
                              style: const TextStyle(
                                letterSpacing: 0.7,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  CurrencyHelper.withCommas(
                          value: product.price, removeDecimal: true) +
                      "₫",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade400,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TopProductSkeleton extends StatelessWidget {
  const _TopProductSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              width: 100,
              child: Column(
                children: [
                  const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                    height: 80,
                    width: 80,
                  )),
                  const SizedBox(height: 4),
                  SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                    lines: 1,
                    lineStyle: SkeletonLineStyle(
                      height: 10,
                    ),
                  )),
                  const SizedBox(height: 3),
                  SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                    lines: 1,
                    lineStyle: SkeletonLineStyle(
                      height: 8,
                    ),
                  )),
                ],
              ));
        });
  }
}
