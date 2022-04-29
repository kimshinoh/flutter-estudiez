import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/location/location.dart';
import 'package:fruity/widgets/cart_button.dart';
import 'package:provider/provider.dart';

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
    _topPadding ??= MediaQuery.of(context).padding.top;
    _centerX ??= MediaQuery.of(context).size.width / 2;

    double percent = shrinkOffset / ((maxExtent - minExtent));
    percent = percent > 1 ? 1 : percent;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      color: getColorHeader(percent),
      child: Stack(
        children: <Widget>[
          _buildAddressAndIcons(shrinkOffset, context),
          _buildSearchBox(percent, context),
        ],
      ),
    );
  }

  Widget _buildAddressAndIcons(double shrinkOffset, BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    LocationStore _locationStore = context.read<LocationStore>();

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: _topPadding!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 1 - shrinkOffset / maxExtent,
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
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.list_user_addressres,
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CartButton(badgeColor: Colors.red),
                  const Icon(
                    Icons.message_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double getScaledWidth(double width, double percent) =>
      width - ((width - minWidth) * percent);

  Color getColorHeader(double percent) =>
      AppColors.palette.shade600.withOpacity(percent);

  Widget _buildSearchBox(double percent, BuildContext context) {
    final double rangeTop = minExtent - _shrinkedTopPos + 4;

    final double top = minExtent - (rangeTop * percent) - 30;

    return Positioned(
      top: top,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.search,
          );
        },
        child: SizedBox(
          width: getScaledWidth(searchBarMaxWidth, percent),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.greenAccent),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
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
