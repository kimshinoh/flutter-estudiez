import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/cart/widgets/cart_item.dart';
import 'package:fruity/ui/order/order_confirm_screen.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/login_button.dart';
import 'package:provider/provider.dart';

class ListCartItem extends StatefulWidget {
  const ListCartItem({Key? key}) : super(key: key);

  @override
  State<ListCartItem> createState() => _ListCartItemState();
}

class _ListCartItemState extends State<ListCartItem> {
  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = context.read<CartStore>();
    final AuthStore _authStore = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        final Map<String, List<CartItem>> groupItemsBySeller =
            _cartStore.groupedItemsBySeller;
        final List<String> sellers = groupItemsBySeller.keys.toList();

        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 10,
            ),
          ),
          shrinkWrap: true,
          itemCount: sellers.length,
          itemBuilder: (BuildContext context, int index) {
            final String sellerId = sellers[index];
            final List<CartItem>? items = groupItemsBySeller[sellerId];

            final Seller? seller = _cartStore.sellerStore.sellersMap[sellerId];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: prefer_if_elements_to_conditional_expressions
                  if (seller != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image(
                                    image: NetworkImage(seller.logo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      seller.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Giao từ: ${seller.headQuarter}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          )
                        ],
                      ),
                    )
                  else
                    Container(),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(-10),
                        bottomRight: Radius.circular(-10),
                      ),
                    ),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int subIndex) {
                        return CartItemWidget(
                          item: groupItemsBySeller[sellers[index]]![subIndex],
                        );
                      },
                      itemCount: items!.length,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đã chọn ${items.length}/${items.length} sản phẩm',
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                text: 'Tổng: ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${CurrencyHelper.withCommas(value: _cartStore.totalPriceBySeller[sellerId] ?? 0, removeDecimal: true)} ₫',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.palette.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (_authStore.isLoggedIn)
                          ElevatedButton(
                            onPressed: () {
                              final List<CartItem>? _selectedItems = _cartStore
                                  .groupedItemsBySellerSelected[sellerId];

                              if (_selectedItems == null ||
                                  _selectedItems.isEmpty) {
                                return;
                              }
                              Navigator.pushNamed(
                                context,
                                Routes.confirm_order,
                                arguments: ConfirmOrderAgruments(
                                  sellerId: sellerId,
                                ),
                              );
                            },
                            child: const Text('Chọn mua'),
                          )
                        else
                          LoginButton(
                            title: 'Chọn mua',
                          )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
