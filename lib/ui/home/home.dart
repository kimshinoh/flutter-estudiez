import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/home/widgets/grid_categories.dart';
import 'package:fruity/ui/home/widgets/header_home.dart';
import 'package:fruity/ui/home/widgets/sale_off.dart';
import 'package:fruity/ui/home/widgets/sale_shock.dart';
import 'package:fruity/widgets/gradient_text.dart';
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Observer(
      builder: (_) {
        return Scaffold(
          floatingActionButton:
              !_store.isLoggedIn ? const LoginBottomSheet() : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverStack(
                insetOnOverlap: true,
                children: [
                  SliverToBoxAdapter(child: _body(width, height)),
                  SliverPersistentHeader(
                    delegate: MyHomeHeader(
                      minWidth: width * 0.75,
                      searchBarMaxWidth: width * 0.94,
                    ),
                    pinned: true,
                  ),
                ],
              )
            ],
          ),
        );
      },
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
          AppColors.palette.shade400,
        ],
      ),),
      child: _underHeader(width, height),
    );
  }

  Widget _mainBody(double width, double height) {
    return SizedBox(
      // height: 800,
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
                  ],),),
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
                  // ),
                  Container(
                    width: width * 0.9,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
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
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
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
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                child: SizedBox.fromSize(
                                                  child: Image.asset(
                                                    'assets/images/dautangtrongiu.jpg',
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
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(3),
                                                    ),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2),
                                                    child: Text(
                                                      '-30%',
                                                      style: TextStyle(
                                                        letterSpacing: 0.7,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          '23.000₫',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange.shade400,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                  _mainBody(width, height)
                ],
              ),)
        ],
      ),
    );
  }
}
