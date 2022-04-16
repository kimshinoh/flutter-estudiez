import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/stores/category/product_store.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/rediant-gradient.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class SaleOff extends StatefulWidget {
  const SaleOff({Key? key}) : super(key: key);
  @override
  _SaleOffState createState() => _SaleOffState();
}

class _SaleOffState extends State<SaleOff> {
  late ProductStore _productStore;
  @override
  void initState() {
    _productStore = context.read<ProductStore>();
    _productStore.getProductsSaleOff(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '🔥 SALE OFF',
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
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: const Text(
              'Thực phẩm tươi ngon - Giá tốt mỗi ngày',
              style: TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 124, 124, 124),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 130,
              width: width * 0.95,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/saleoff.png',
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
            height: 310,
            width: width,
            child: Skeleton(
              isLoading: _productStore.loading,
              skeleton: const _SaleOffSkeleton(),
              child: _buildSaleOff(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSaleOff() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _productStore.productsSaleOff.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < _productStore.productsSaleOff.length) {
          return _builderItem(context, index);
        }
        return _watchMore(context);
      },
    );
  }

  Widget _watchMore(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 325,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.arrow_circle_right_rounded,
              size: 40,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Xem thêm',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builderItem(BuildContext context, int index) {
    final Product product = _productStore.productsSaleOff[index];
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        color: Colors.white,
        width: 150,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 125,
                  height: 125,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: SizedBox.fromSize(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.seller.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    RadiantGradientMask(
                      firstColor: Colors.orange,
                      secondColor: Colors.yellow,
                      child: Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: '${CurrencyHelper.withCommas(
                      value: product.price,
                      removeDecimal: true,
                    )}₫',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: ' / ${product.unit}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                if (product.oldPrice != null)
                  Text(
                    '${CurrencyHelper.withCommas(
                      value: product.oldPrice,
                      removeDecimal: true,
                    )}₫',
                    style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  size: 24,
                  color: AppColors.palette.shade500,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SaleOffSkeleton extends StatelessWidget {
  const _SaleOffSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          color: Colors.white,
          width: 150,
          child: Column(
            children: const [
              SizedBox(
                width: 125,
                height: 125,
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
