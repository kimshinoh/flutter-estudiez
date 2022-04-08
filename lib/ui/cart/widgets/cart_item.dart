import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/utils/money.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  CartItem item;

  CartItemWidget({Key? key, required this.item}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CartStore _cartStore = context.read<CartStore>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name.trim(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
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
                                        '${CurrencyHelper.withCommas(value: item.price, removeDecimal: true)}  đ',
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
                            const SizedBox(width: 10),
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
                        ' = ${CurrencyHelper.withCommas(value: item.price * item.quantity, removeDecimal: true)}  đ',
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.only(right: 10),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.remove_circle,
                              size: 24, color: AppColors.palette.shade500),
                          onPressed: () {
                            if (item.quantity == 1) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text('Hủy'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          TextButton(
                                            child: Text('Xóa'),
                                            onPressed: () {
                                              _cartStore.removeItem(item);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ));
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
                          padding: EdgeInsets.only(left: 10),
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.add_circle,
                              size: 24, color: AppColors.palette.shade500),
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
