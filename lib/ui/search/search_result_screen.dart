import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/category/search_product_store.dart';
import 'package:fruity/stores/search/search.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/seller/seller_detail_screen.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/rediant-gradient.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late SearchStore _searchStore;
  final SearchProductStore _searchProductStore = SearchProductStore();
  final List<Map<String, dynamic>> _filters = [
    {'id': 'uytin', 'name': 'Uy tín', 'selected': true},
    {'id': 'banchay', 'name': 'Bán chạy'},
    {'id': 'hangmoi', 'name': 'Hàng mới'},
    {'id': 'gantoi', 'name': 'Gần tôi'},
  ];

  // 0 is none, 1 is asc, 2 is desc
  final List<int> _sortTypes = [0, 1, 2];
  late int _sort;
  @override
  void initState() {
    _searchStore = context.read<SearchStore>();
    _searchStore.searchProduct(20);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<SearchProductStore>(
        create: (_) => _searchProductStore,
        child: SafeArea(
            child: Scaffold(
          body: _buildBody(),
        )));
  }

  Widget _buildBody() {
    _sort = _searchProductStore.searchType;
    return CustomScrollView(slivers: <Widget>[
      SliverPinnedHeader(
        child: Column(
          children: [
            _header(),
            _buildFilter(),
          ],
        ),
      ),
      SliverToBoxAdapter(
          child: Container(
        decoration: const BoxDecoration(color: AppColors.backgroudGrey),
        child: Column(
          children: [
            const SizedBox(height: 5),
            _buildSeller(),
            _buildSearchResult()
          ],
        ),
      )),
    ]);
  }

  Widget _header() {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 70.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.palette,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SearchScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.greenAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  height: 35,
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            _searchStore.keyword,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilter() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      height: 60,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: width * 0.78,
              height: 50,
              child: ListView.builder(
                itemCount: _filters.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (final Map<String, dynamic> f in _filters) {
                          f['selected'] = false;
                        }
                        _filters[index]['selected'] = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _filters[index]['name']!.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _getColor(index, Colors.grey),
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 30,
                            color: _getColor(index, Colors.transparent),
                            margin: const EdgeInsets.only(top: 6),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.grey,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _searchProductStore.searchType = _sortTypes[
                      (_sortTypes.indexOf(_sort) + 1) % _sortTypes.length];
                });
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Giá',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: _sort == 0 ? Colors.grey : Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: _getIcon(),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Color _getColor(int index, Color defaultColor) {
    return _filters[index]['selected'] == true
        ? AppColors.primary
        : defaultColor;
  }

  Widget _getIcon() {
    if (_sort == 1) {
      return const Icon(Icons.arrow_circle_up, color: Colors.orange);
    }
    if (_sort == 2) {
      return const Icon(Icons.arrow_circle_down, color: Colors.orange);
    }

    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: const Icon(
        Icons.compare_arrows_outlined,
        color: Colors.grey,
        size: 20,
      ),
    );
  }

  Widget _buildSeller() {
    return Observer(builder: (_) {
      if (_searchProductStore.products.isEmpty) {
        return Container();
      }

      final Seller seller = _searchProductStore.products[0].seller;
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.seller_detail,
                arguments: SellerDetailAgruments(sellerId: seller.id));
          },
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    seller.logo,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          seller.name.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          seller.headQuarter,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Nhà bán khác',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSearchResult() {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
            child: _searchStore.loading
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  )
                : _searchStore.products.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: Text('Không tìm thấy sản phẩm nào'),
                        ),
                      )
                    : _gridProducts()),
      );
    });
  }

  Widget _gridProducts() {
    final double cardWidth = MediaQuery.of(context).size.width / 3;
    final double cardHeight = MediaQuery.of(context).size.height / 3.8;
    _searchProductStore.getProductsByIds(_searchStore.productIds);
    return Observer(
        builder: (_) => _searchProductStore.loading
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: cardWidth / cardHeight,
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(_searchProductStore.products.length,
                    (int index) {
                  final Product product = _searchProductStore.products[index];
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 130,
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: SizedBox.fromSize(
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.fitWidth,
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
                                  text: CurrencyHelper.withCommas(
                                      value: product.price),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' / 1 ${product.unit}',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                CurrencyHelper.withCommas(
                                    value: product.oldPrice),
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
                }),
              ));
  }
}
