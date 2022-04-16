import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'dart:math' as math;

import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/rediant-gradient.dart';

class SearchResultScreen extends StatefulWidget {
  final String search;
  const SearchResultScreen({Key? key, required this.search}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final List<Map<String, dynamic>> _filters = [
    {'id': 'uytin', 'name': 'Uy tín', 'selected': true},
    {'id': 'banchay', 'name': 'Bán chạy'},
    {'id': 'hangmoi', 'name': 'Hàng mới'},
    {'id': 'gantoi', 'name': 'Gần tôi'},
  ];

  // 0 is none, 1 is asc, 2 is desc
  final List<int> _sortTypes = [0, 1, 2];
  int _sort = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Container(
      decoration: const BoxDecoration(color: AppColors.backgroudGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _header(),
          _buildFilter(),
          const SizedBox(height: 5),
          _buildSeller(),
          _buildSearchResult()
        ],
      ),
    ));
  }

  Widget _header() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
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
                            widget.search,
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
              )),
            ],
          ),
        ));
  }

  Widget _buildFilter() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        height: 60,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 3),
                  width: width * 0.78,
                  height: 45,
                  child: ListView.builder(
                    itemCount: _filters.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _filters.forEach((f) {
                                f['selected'] = false;
                              });
                              _filters[index]['selected'] = true;
                            });
                          },
                          child: Container(
                            width: 73,
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  _filters[index]['name']!.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: _getColor(index),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (_filters[index]['selected'] == true)
                                  Divider(
                                    color: AppColors.primary,
                                    height: 1,
                                    thickness: 3,
                                    indent: 20,
                                    endIndent: 20,
                                  )
                              ],
                            ),
                          ));
                    },
                  ))),
          VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.grey,
          ),
          Container(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Giá",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: _sort == 0 ? Colors.grey : Colors.orange)),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      _sort = _sortTypes[
                          (_sortTypes.indexOf(_sort) + 1) % _sortTypes.length];
                    });
                  },
                  icon: Container(
                    height: 20,
                    width: 20,
                    child: _getIcon(),
                  ))
            ]),
          )
        ]));
  }

  Color _getColor(int index) {
    return _filters[index]['selected'] == true
        ? AppColors.primary
        : Colors.grey;
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
        ));
  }

  Widget _buildSeller() {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/fruit2.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vua dừa xiêm bến tre".toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "888 Đường Láng. Láng Thượng, Đống Đa, Hà Nội",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Nhà bán khác",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 15,
                )
              ],
            )
          ],
        ));
  }

  Widget _buildSearchResult() {
    double cardWidth = MediaQuery.of(context).size.width / 3;
    double cardHeight = MediaQuery.of(context).size.height / 3.8;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: cardWidth / cardHeight,
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: List.generate(4, (int index) {
            return InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 130,
                        width: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: SizedBox.fromSize(
                            child: Image.network(
                              "https://images.f99.com.vn/images/3ee980bb-938c-4ff3-a91c-8622f57723ec.jpg?width=250&height=250",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Dừa xiêm bến tre",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "HOME FRUIT",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
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
                          text: "123123₫",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' / 1 quả',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "123123₫",
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
                      ))
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
