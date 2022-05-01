import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/ui/product/widgets/product_horizon.dart';
import 'package:fruity/widgets/gradient_icon.dart';
import 'package:fruity/widgets/gradient_text.dart';
import 'package:fruity/widgets/rediant-gradient.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showbtn = false;
  var top = 0.0;
  String html =
      '<p class="ql-align-justify"><span style="color: rgb(0, 0, 0); background-color: transparent;">Ambrosia có nghĩa là "thức ăn của các vị thần" như mô tả trong thần thoại Hy Lạp cổ đại. Táo có một hương vị ngọt ngào, giòn, nhiều nước và thơm.</span></p><p class="ql-align-justify"><strong style="color: rgb(0, 0, 0); background-color: transparent;">Xuất xứ:</strong><span style="color: rgb(0, 0, 0); background-color: transparent;"> Canada</span></p><p class="ql-align-justify"><strong style="color: rgb(0, 0, 0); background-color: transparent;">Mùa vụ: </strong><span style="color: rgb(0, 0, 0); background-color: transparent;">Táo có mùa vụ từ tháng 02 đến tháng 08 hàng năm. Nhờ công nghệ CA (Controlled Atmosphere Storage) là công nghệ lưu trữ táo trong môi trường không khí được điều khiển về nhiệt độ, hàm lượng Oxy, CO2, và độ ẩm nên táo có thể được bảo quản lên tới 6 tháng mà vẫn giữ được độ tươi ngon, ngọt, giòn và thơm.&nbsp;</span></p><p class="ql-align-justify"><span style="color: rgb(0, 0, 0); background-color: transparent;">﻿</span></p><p class="ql-align-justify"><strong style="color: rgb(0, 0, 0); background-color: transparent;">Thông tin dinh dưỡng:&nbsp;</strong></p><ul><li class="ql-align-justify"><span style="background-color: transparent;">Có hàm lượng Axit thấp, là một lựa chọn tốt cho trẻ em và người già vì dễ tiêu hóa.</span></li><li class="ql-align-justify"><span style="background-color: transparent;">Hàm lượng chất chống oxy hóa cao ngăn ngừa các gốc tự do gây ra ung thư và chống lại quá trình lão hóa tự nhiên.</span></li><li class="ql-align-justify"><span style="background-color: transparent;">Vitamin A, C dồi dào giúp tăng cường hệ miễn dịch trong cơ thể, phòng chống lại các bệnh lây nhiễm qua đường hô hấp.</span></li><li class="ql-align-justify"><span style="background-color: transparent;">Chất kẽm trong táo làm tăng khả năng ghi nhớ của não người. Mặt khác, kẽm còn phối hợp với một số chất để tạo ra kháng thể, nâng cao khả năng đề kháng của cơ thể. Ngoài ra táo còn chứa các nguyên tố vi lượng khác như canxi, kali, sắt, phốt pho, các vitamin C, B1, B2.</span></li></ul><p class="ql-align-justify"><strong style="color: rgb(0, 0, 0); background-color: transparent;">Hướng dẫn sử dụng:</strong><span style="color: rgb(0, 0, 0); background-color: transparent;"> Ăn trực tiếp, dùng làm nước ép, sinh tố hoặc salad.</span></p><p class="ql-align-justify"><strong style="color: rgb(0, 0, 0); background-color: transparent;">Hướng dẫn bảo quản:</strong><span style="color: rgb(0, 0, 0); background-color: transparent;"> Bảo quản trong Tủ lạnh từ 4 đến 8 độ C, táo sẽ giữ được độ tươi, độ giòn trong vòng 1-4 tuần. Sau thời gian này, táo sẽ ngọt hơn, độ PSI thấp hơn (táo xốp hơn). Cần tránh để táo với các thực phẩm có mùi khác như hành, tỏi, táo sẽ dễ nhiễm mùi.&nbsp;</span></p>';
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
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.ios_share_sharp),
                    onPressed: () {},
                  ),
                ],
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                          duration: Duration(milliseconds: 100),
                          opacity: top ==
                                  MediaQuery.of(context).padding.top +
                                      kToolbarHeight
                              ? 1.0
                              : 0.0,
                          child: Container(
                            width: width * 0.45,
                            child: Text(
                              'Product Detail 12312 3123 123',
                              style: TextStyle(fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      background: Image.network(
                        'https://images.f99.com.vn/images/7a53bf19-b702-45c0-b2e8-98c86d0bb285.jpg',
                        fit: BoxFit.fill,
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
          )),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: showbtn ? .7 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(0,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn);
          },
          child: const Icon(Icons.keyboard_arrow_up_outlined),
          backgroundColor: Colors.grey,
        ),
      ),
    );
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
        _description(),
        _divider(),
        _reviews(),
        _divider(),
        _similarProducts(),
      ],
    ));
  }

  Widget _similarProducts() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sản phẩm tương tự',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {},
                  child: ProductHorizon(
                    imageLink:
                        "https://images.f99.com.vn/images/21ebd004-3c5f-437e-b012-6b6756e5eaa4.png?width=250&height=250",
                    name: "Product Name",
                    sellerName: "Seller name",
                    price: 500000,
                    sold: 30,
                    unit: "Kg",
                  ));
            },
          )
        ],
      ),
    );
  }

  Widget _reviews() {
    return Container(
        height: 300,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Đánh giá sản phẩm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
                children: List.generate(2, (index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                              "https://f99.com.vn/img/mua-chung/icon-trai-cay-1.png",
                              width: 30,
                              height: 30),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("093****123",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    GradientIcon(
                                      Icons.star,
                                      20,
                                      LinearGradient(
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
                      Text("1kg",
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("30/04/2022 17:51",
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ],
                  ));
            })),
          ],
        ));
  }

  Widget _description() {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                child: Text("Mô tả sản phẩm",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Đơn vị bán",
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
                Text("Kg", style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Xuất xứ",
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
                Text("Việt Nam",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )),
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
                        child: Html(
                          data: html,
                        )))),
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
                        showModalBottom(html);
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Xem thêm",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blue)),
                            Icon(Icons.keyboard_arrow_down_sharp,
                                color: Colors.blue)
                          ]),
                    )))
          ]),
    );
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
        return Html(data: html);
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
    return Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
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
                          TextSpan(
                            text: "Giao đến ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '1 Nguyễn Đổng Chi, Nam Từ Liêm, Hà Nội',
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
                    )),
                Expanded(
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
              height: 70,
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
                    "Dự kiến nhận hàng lúc 08:00 30/04/1975",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    "99.999₫ (*Chỉ giao hàng tại Hà Nội)",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _quickInfo() {
    return Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ổi ối dồi ôi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '50,000 ₫',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.palette.shade500,
                    ),
                  ),
                  TextSpan(
                    text: '/ kg',
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
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Xoài',
                      style: TextStyle(fontSize: 15, color: Colors.black54)),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_basket,
                        size: 15,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Đã bán 999',
                          style:
                              TextStyle(fontSize: 15, color: Colors.black54)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(0, 255, 255, 255), Colors.white]);
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}
