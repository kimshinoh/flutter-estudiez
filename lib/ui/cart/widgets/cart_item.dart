import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  CartItem item;

  CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = context.read<CartStore>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: item.isSelected,
                onChanged: (bool? value) {
                  _cartStore.selectItem(item);
                },
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox.fromSize(
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.name.trim(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartStore.removeItem(item);
                        },
                        icon: const Icon(Icons.close, size: 20),
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.only(left: 20),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${CurrencyHelper.withCommas(value: item.price, removeDecimal: true)} ₫',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.palette.shade500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/ ${item.unit}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'x ${item.quantity}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ' = ${CurrencyHelper.withCommas(value: item.price * item.quantity, removeDecimal: true)}  ₫',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.palette.shade500,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(right: 10),
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            Icons.remove_circle,
                            size: 24,
                            color: AppColors.palette.shade500,
                          ),
                          onPressed: () {
                            if (item.quantity == 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Hủy'),
                                    ),
                                    TextButton(
                                      child: const Text('Xóa'),
                                      onPressed: () {
                                        _cartStore.removeItem(item);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                              return;
                            }
                            _cartStore.updateQuantity(item, item.quantity - 1);
                          },
                        ),
                        Text(
                          item.quantity.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.palette.shade500,
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(left: 10),
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            Icons.add_circle,
                            size: 24,
                            color: AppColors.palette.shade500,
                          ),
                          onPressed: () {
                            _cartStore.updateQuantity(item, item.quantity + 1);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
