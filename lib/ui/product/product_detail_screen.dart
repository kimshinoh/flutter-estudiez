import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/extensions/string_extension.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/location/location.dart';
import 'package:fruity/stores/product/product_detail_store.dart';
import 'package:fruity/ui/product/widgets/product_horizon.dart';
import 'package:fruity/ui/seller/seller_detail_screen.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/widgets/cart_button.dart';
import 'package:fruity/widgets/gradient_icon.dart';
import 'package:fruity/widgets/seller_logo.dart';
import 'package:provider/provider.dart';

class ProductDetailAgruments {
  final String id;
  ProductDetailAgruments(this.id);
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  late ProductDetailStore _productDetailStore;

  late ProductDetailAgruments arguments;

  bool showbtn = false;
  double top = 0.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      double showoffset = 20.0;

      if (_scrollController.offset > showoffset) {
        setState(() {
          showbtn = true;
        });
      } else {
        setState(() {
          showbtn = false;
        });
      }
    });
    super.initState();
    _productDetailStore = ProductDetailStore();
    _productDetailStore.setupUpdateProduct();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailAgruments;
    _productDetailStore.getProductDetail(arguments.id);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Provider(create: (context) => _productDetailStore, child: _layout()),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: showbtn ? .7 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          },
          child: const Icon(Icons.keyboard_arrow_up_outlined),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  Widget _layout() {
    final double width = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      ProductDetailStore _productDetailStore =
          context.read<ProductDetailStore>();

      return Observer(builder: (_) {
        if (_productDetailStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: <Widget>[
                  CartButton(
                    badgeColor: Colors.red,
                  )
                ],
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: top ==
                                MediaQuery.of(context).padding.top +
                                    kToolbarHeight
                            ? 1.0
                            : 0.0,
                        child: Container(
                          width: width * 0.6,
                          child: Text(
                            _productDetailStore.product!.name,
                            style: const TextStyle(fontSize: 15),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      background: Image.network(
                        _productDetailStore.product!.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ];
          },
          body: SizedBox(
            width: width,
            child: _body(),
          ),
        );
      });
    });
  }

  Widget _body() {
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _quickInfo(),
          _divider(),
          _deliveryInfo(),
          _divider(),
          _seller(),
          _divider(),
          _description(),
          _divider(),
          // _reviews(),
          _similarProducts(),
        ],
      ),
    );
  }

  Widget _similarProducts() {
    final double width = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      ProductDetailStore _productDetailStore =
          context.read<ProductDetailStore>();

      return Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sản phẩm tương tự',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _productDetailStore.relateProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = _productDetailStore.relateProducts[index];
                  return InkWell(
                    onTap: () {
                      _productDetailStore.getProductDetail(product.id);
                    },
                    child: ProductHorizon(
                      product: product,
                    ),
                  );
                },
              )
            ],
          ),
        );
      });
    });
  }

  Widget _reviews() {
    return Builder(builder: (context) {
      return Observer(builder: (_) {
        Product? product = _productDetailStore.product;
        if (product == null) {
          return Container();
        }
        return Container(
          height: 300,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Đánh giá sản phẩm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(2, (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'https://f99.com.vn/img/mua-chung/icon-trai-cay-1.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '093****123',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      GradientIcon(
                                        Icons.star,
                                        20,
                                        const LinearGradient(
                                          colors: <Color>[
                                            Color.fromARGB(255, 255, 225, 180),
                                            Color.fromARGB(255, 255, 124, 54),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          '1kg',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          '30/04/2022 17:51',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      });
    });
  }

  Widget _seller() {
    return Builder(builder: (context) {
      ProductDetailStore _store = context.read<ProductDetailStore>();
      return Observer(builder: (_) {
        Product? product = _store.product;
        if (product == null) {
          return Container();
        }

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.seller_detail,
                arguments: SellerDetailAgruments(sellerId: product.sellerId));
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nhà cung cấp',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SellerLogo(
                        size: const Size(25, 25), logoUrl: product.seller.logo),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.seller.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.seller.headQuarter,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  Widget _description() {
    return Builder(builder: (context) {
      ProductDetailStore _store = context.read<ProductDetailStore>();
      return Observer(builder: (_) {
        Product? product = _store.product;
        if (product == null) {
          return Container();
        }

        return Container(
          height: 350,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Mô tả sản phẩm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Đơn vị bán',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Text(
                      (product.unit ?? '').capitalize(),
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Xuất xứ',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Text(
                      product.origin == null || product.origin!.isEmpty
                          ? 'Việt nam'
                          : product.origin!,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 120,
                  child: CustomPaint(
                    foregroundPainter: FadingEffect(),
                    child: Html(data: product.description),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      showModalBottom(product.description);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Xem thêm',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
    });
  }

  void showModalBottom(String html) {
    showModalBottomSheet<void>(
      // border top corner
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [Html(data: html)],
        );
      },
    );
  }

  Widget _divider() {
    return Container(
      height: 10,
      color: AppColors.backgroudGrey,
    );
  }

  Widget _deliveryInfo() {
    return Builder(builder: (context) {
      LocationStore _locationStore = context.read<LocationStore>();
      return Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 8,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Giao đến ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: _locationStore.address,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dự kiến nhận hàng lúc ${DateTimeHelper.formatDate(DateTime.now().add(const Duration(minutes: 30)), "HH:mm dd/MM/yyyy")}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _quickInfo() {
    return Builder(builder: (context) {
      ProductDetailStore _productDetailStore =
          context.read<ProductDetailStore>();

      return Observer(builder: (_) {
        Product? product = _productDetailStore.product;
        if (product == null) {
          return Container();
        }

        return Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                product.name.capitalize(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    if (product.oldPrice != null && product.oldPrice! > 0)
                      TextSpan(
                        text:
                            '${CurrencyHelper.withCommas(value: product.oldPrice, removeDecimal: true)} ₫ ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    TextSpan(
                      text:
                          '${CurrencyHelper.withCommas(value: product.price, removeDecimal: true)} ₫',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.palette.shade500,
                      ),
                    ),
                    TextSpan(
                      text: "/ ${(product.unit ?? "").capitalize()}",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          product.tags.join(', '),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.shopping_basket,
                          size: 15,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Đã bán 999',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(0, 255, 255, 255), Colors.white],
    );
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}
