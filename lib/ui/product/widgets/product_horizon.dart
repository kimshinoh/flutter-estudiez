import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/utils/currency_util.dart';
import 'package:fruity/widgets/rediant-gradient.dart';

class ProductHorizon extends StatelessWidget {
  final String imageLink;
  final String name;
  final String sellerName;
  final double price;
  final String unit;
  final int sold;

  const ProductHorizon(
      {Key? key,
      required this.imageLink,
      required this.name,
      required this.sellerName,
      required this.price,
      required this.sold,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                height: width * 0.3,
                width: width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageLink,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        sellerName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
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
                          text: CurrencyHelper.withCommas(value: price),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' / ${unit}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Đã bán ${sold.toString()}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const Icon(
                            Icons.add_circle,
                            size: 30,
                            color: AppColors.primary,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
