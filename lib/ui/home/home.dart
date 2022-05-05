import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/category/product_store.dart';
import 'package:fruity/stores/location/location.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/home/widgets/custom_header/custom_header.dart';
import 'package:fruity/ui/home/widgets/grid_categories.dart';
import 'package:fruity/ui/home/widgets/sale_off.dart';
import 'package:fruity/ui/home/widgets/sale_shock.dart';
import 'package:fruity/ui/home/widgets/top_products.dart';
import 'package:fruity/widgets/cart_button.dart';
import 'package:fruity/widgets/login_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthStore _store;
  late int currentIndex;
  late double topPosition = 190;
  final ScrollController _scrollController = ScrollController();
  late double offset = 0;
  final double maxPosition = 190;
  final double minPosition = 160;
  final double maxExtent = 130;
  final double minExtent = 90;
  late double percent = 0;
  List<Image> banners = [
    Image.asset(
      'assets/images/banner_1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/banner_2.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/banner_1.png',
      fit: BoxFit.cover,
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _store = context.read<AuthStore>();
    currentIndex = 0;
    _scrollController.addListener(() {
      offset = _scrollController.offset;
      percent = offset / ((maxExtent - minExtent));
      percent = percent > 1 ? 1 : percent;
      setState(() {
        topPosition = (maxPosition - minPosition) * (1 - percent) + minPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LocationStore _locationStore = context.read<LocationStore>();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Provider<ProductStore>(
      create: (_) => ProductStore(),
      child: Scaffold(
        floatingActionButton: LoginBottomSheet(),
        floatingActionButtonLocation: !_store.isLoggedIn
            ? FloatingActionButtonLocation.centerFloat
            : null,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverStack(
              insetOnOverlap: false,
              children: [
                SliverToBoxAdapter(child: _body(width, height)),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FlexibleHeaderDelegate(
                    myOffset: offset,
                    statusBarHeight: MediaQuery.of(context).padding.top,
                    expandedHeight: 130,
                    background: const MutableBackground(
                      collapsedColor: AppColors.primary,
                      expandedColor: Colors.transparent,
                    ),
                    builderAction: (context, progress) {
                      return Container(
                          width: width,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                    opacity: 1 - progress,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: width * 0.7,
                                          child: TextButton(
                                            onPressed: () => 1 - progress == 0
                                                ? null
                                                : Navigator.pushNamed(
                                                    context,
                                                    Routes.list_user_addressres,
                                                  ),
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: Observer(builder: (_) {
                                              return Text(
                                                _locationStore.address,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              );
                                            }),
                                          ),
                                        )
                                      ],
                                    )),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: CartButton(
                                    badgeColor: Colors.red,
                                  ),
                                )
                              ]));
                    },
                    child: FlexibleHeaderItem(
                      expandedAlignment: Alignment.topCenter,
                      expandedPadding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                      collapsedPadding: const EdgeInsets.fromLTRB(10, 0, 60, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.search,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.greenAccent),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                          ),
                          height: 35,
                          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'Freeship toàn sàn - An tâm phòng dịch',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              Icon(Icons.search, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _body(double width, double height) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(.2),
          ],
        ),
      ),
      child: _underHeader(width, height),
    );
  }

  Widget _mainBody(double width, double height) {
    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            // height: height,
            width: width,
            decoration: const BoxDecoration(
              color: AppColors.backgroudGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: const [
                GridCategory(),
                SizedBox(height: 10),
                SaleOff(),
                SizedBox(height: 10),
                SaleShock()
              ],
            ),
          ),
          Positioned(
            top: -101,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/category1.png',
                  fit: BoxFit.cover,
                  width: width * 0.3,
                ),
                Image.asset(
                  'assets/images/category2.png',
                  fit: BoxFit.cover,
                  width: width * 0.35,
                ),
                Image.asset(
                  'assets/images/category3.png',
                  fit: BoxFit.cover,
                  width: width * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _underHeader(double width, double height) {
    return Container(
      constraints: BoxConstraints(minHeight: height * 3),
      child: Stack(
        children: [
          CarouselSlider(
            items: banners.map((Image e) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: width,
                    height: height,
                    child: e,
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (int i, CarouselPageChangedReason r) {
                setState(() {
                  currentIndex = i;
                });
              },
            ),
          ),
          Positioned.fill(
            top: topPosition,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: banners.length,
                      effect: ScrollingDotsEffect(
                        fixedCenter: true,
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.white,
                        dotColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                TopProducts(),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
                _mainBody(width, height)
              ],
            ),
          )
        ],
      ),
    );
  }
}
