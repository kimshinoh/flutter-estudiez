import 'package:flutter/material.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/widgets/seller_logo.dart';

class SellerInfoWidget extends StatelessWidget {
  Seller seller;
  SellerInfoWidget({Key? key, required this.seller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SellerLogo(size: Size(50, 50), logoUrl: seller.logo),
        const SizedBox(
          width: 10,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                seller.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                seller.getType(),
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
