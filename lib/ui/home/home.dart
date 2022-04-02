import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/home/widgets/header_home.dart';
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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AuthStore _store;
  late int currentIndex;
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
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton:
            !_store.isLoggedIn ? const LoginBottomSheet() : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverStack(insetOnOverlap: true, children: [
              SliverToBoxAdapter(child: _body(width, height)),
              SliverPersistentHeader(
                delegate: MyHomeHeader(
                  minWidth: width * 0.75,
                  searchBarMaxWidth: width * 0.94,
                ),
                pinned: true,
              ),
            ])
          ],
        ),
      );
    },);
  }

  Widget _body(double width, double height) {
    return Container(
        color: AppColors.primary,
        child: Column(children: [
          Stack(children: [
            CarouselSlider(
                items: banners.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: width,
                        height: height,
                        child: e,
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  // aspectRatio: 4/3,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: (i, r) {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 5),
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
                    )),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          Container(
            width: width * 0.9,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Container(
                                  child: Image.asset(
                                'assets/images/hot.png',
                                width: 40,
                              )),
                              GradientText(
                                'Top Sản Phẩm',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                gradient: LinearGradient(colors: [
                                  Colors.orange.shade400,
                                  Colors.orange.shade900,
                                ]),
                              ),
                            ],
                          )),
                          Container(
                              child: Row(
                            children: [
                              Text('Xem thêm',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              Icon(Icons.arrow_forward_ios,
                                  size: 15, color: Colors.grey)
                            ],
                          ))
                        ])),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 5),
                // child:
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          child: Column(
                            children: [
                              Container(
                                  width: 95,
                                  height: 95,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: SizedBox.fromSize(
                                            child: Image.asset(
                                              'assets/images/dautangtrongiu.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 40,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade100,
                                            border: Border.all(
                                                color: Colors.red, width: 1.2),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(1))),
                                          child: Text(
                                            '-30%',
                                            
                                            style: TextStyle(
                                              letterSpacing: 0.7,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 8),
                              Text('23.000₫',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade400)),
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_rounded,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                ),
                // )
              ],
            ),
          ),
          const SizedBox(height: 2000)
        ]));
  }
}
