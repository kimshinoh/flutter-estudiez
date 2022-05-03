import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/seller/seller_detail_store.dart';
import 'package:fruity/ui/product/product_detail_screen.dart';
import 'package:fruity/ui/product/widgets/product_horizon.dart';
import 'package:fruity/widgets/cart_button.dart';
import 'package:fruity/widgets/map_view.dart';
import 'package:fruity/widgets/seller_logo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SellerDetailAgruments {
  final String sellerId;

  SellerDetailAgruments({
    required this.sellerId,
  });
}

class SellerDetailScreen extends StatelessWidget {
  const SellerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerDetailStore _sellerDetailStore = SellerDetailStore();

    SellerDetailAgruments agruments =
        ModalRoute.of(context)!.settings.arguments as SellerDetailAgruments;
    _sellerDetailStore.setupUpdateSeller();
    _sellerDetailStore.getSeller(agruments.sellerId);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin nhà cung cấp'),
          centerTitle: true,
          actions: [
            CartButton(
              badgeColor: Colors.red,
            )
          ],
        ),
        body: Provider(
          create: (_) => _sellerDetailStore,
          child: Observer(
            builder: (_) {
              if (_sellerDetailStore.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return _body();
            },
          ),
        ));
  }
}

class _body extends StatefulWidget {
  _body({Key? key}) : super(key: key);

  @override
  State<_body> createState() => _bodyState();
}

class _bodyState extends State<_body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  final List<Widget> _tabs = [
    const _sellerProducts(),
    const _sellerMoreInformation(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const _sellerInfo(),
        Container(
          color: Colors.white,
          child: TabBar(
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                _tabController.animateTo(index);
              });
            },
            indicatorColor: AppColors.palette.shade500,
            controller: _tabController,
            labelColor: AppColors.palette.shade500,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: AppColors.palette.shade100,
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            tabs: const [
              Tab(
                text: 'Sản phẩm',
              ),
              Tab(
                text: 'Giới thiệu',
              ),
            ],
          ),
        ),
        IndexedStack(
          index: selectedIndex,
          children: <Widget>[
            Visibility(
              maintainState: true,
              visible: selectedIndex == 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: const _sellerProducts(),
              ),
            ),
            Visibility(
              maintainState: true,
              visible: selectedIndex == 1,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: const _sellerMoreInformation(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _sellerInfo extends StatelessWidget {
  const _sellerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerDetailStore _sellerDetailStore = context.read<SellerDetailStore>();

    return Observer(
      builder: (_) {
        Seller? seller = _sellerDetailStore.seller;
        if (seller == null) {
          return Container();
        }

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Image(image: NetworkImage(seller.banner)),
            Container(
              width: double.infinity,
              transform: Matrix4.translationValues(0.0, -15, 0.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    transform: Matrix4.translationValues(0.0, -50, 0.0),
                    child: SellerLogo(
                      logoUrl: seller.logo,
                      size: Size(50, 50),
                    ),
                  ),
                  Text(
                    seller.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    seller.headQuarter,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow.shade700,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            seller.rating.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(${seller.totalVote.toString()})',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.motorcycle,
                            size: 20,
                            color: Colors.yellow.shade700,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${_sellerDetailStore.distance.toStringAsFixed(1)}km",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.motorcycle,
                            size: 20,
                            color: Colors.yellow.shade700,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            _sellerDetailStore.minutesToString,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thời gian mở cửa: ${seller.availableTime.openTime} - ${seller.availableTime.closeTime}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),
            )
          ],
        );
      },
    );
  }
}

class _sellerMoreInformation extends StatelessWidget {
  const _sellerMoreInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerDetailStore _sellerDetailStore = context.read<SellerDetailStore>();

    return Observer(builder: (_) {
      Seller? seller = _sellerDetailStore.seller;
      LatLng latLng = _sellerDetailStore.location;

      if (seller == null) {
        return Container();
      }

      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(seller.description),
          SizedBox(
            height: 10,
          ),
          MapView(location: latLng),
        ],
      );
    });
  }
}

class _sellerProducts extends StatelessWidget {
  const _sellerProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerDetailStore _sellerDetailStore = context.read<SellerDetailStore>();

    return Observer(builder: (_) {
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          Product product = _sellerDetailStore.relateProducts[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.product_detail,
                  arguments: ProductDetailAgruments(product.id),
                );
              },
              child: ProductHorizon(product: product));
        },
        itemCount: _sellerDetailStore.relateProducts.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      );
    });
  }
}
