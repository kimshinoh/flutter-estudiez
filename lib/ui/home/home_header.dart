import 'dart:math';

import 'package:flutter/material.dart';


class MyHomeHeader extends SliverPersistentHeaderDelegate {
  MyHomeHeader({
    required this.minWidth,
    required this.searchBarMaxWidth,
  });
  final double minWidth;
  final double searchBarMaxWidth;

  double? _topPadding;
  double? _centerX;

  double get _shrinkedTopPos => 55;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    if (_topPadding == null) {
      _topPadding = MediaQuery.of(context).padding.top;
    }
    if (_centerX == null) {
      _centerX = MediaQuery.of(context).size.width / 2;
    }

    double percent = shrinkOffset / ((maxExtent - minExtent));
    percent = percent > 1 ? 1 : percent;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          _buildAddressAndIcons(shrinkOffset, context),
          _buildSearchBox(percent),
        ],
      ),
    );
  }

  Widget _buildAddressAndIcons(double shrinkOffset, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(top: _topPadding!),
            child: Container(
                child: Row(children: [
              Opacity(
                  opacity: 1 - shrinkOffset / maxExtent,
                  child: Row(children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                    Container(
                        width: width * 0.7,
                        child: Text(
                          '102 Nguyễn Đổng Chi, Cầu Diễn, Nam Từ Liêm, Hà Nội',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))
                  ])),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: width * 0.2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.shopping_basket_outlined,
                          color: Colors.white, size: 25),
                      const SizedBox(width: 15),
                      Icon(Icons.message_sharp, color: Colors.white, size: 25),
                    ]),
              )
            ]))));
  }

  double getScaledWidth(double width, double percent) =>
      width - ((width - minWidth) * percent);

  Widget _buildSearchBox(double percent) {
    final double rangeTop = minExtent - _shrinkedTopPos + 4;

    final double top = minExtent - (rangeTop * (percent)) - 30;

    return Positioned(
      top: top,
      child: Container(
        width: getScaledWidth(searchBarMaxWidth, percent),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.greenAccent),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            height: 35,
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Text(
                  "Freeship toàn sàn - An tâm phòng dịch",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.grey),
                    ])
              ],
            )),
      ),
    );
  }

  @override
  double get maxExtent => 130;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
