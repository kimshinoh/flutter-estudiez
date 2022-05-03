import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';

class SellerLogo extends StatelessWidget {
  Size size;
  String logoUrl;
  SellerLogo({Key? key, required this.size, required this.logoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        backgroundColor: AppColors.palette.shade500,
        radius: size.width,
        child: CircleAvatar(
            backgroundImage: NetworkImage(logoUrl), radius: size.width - 2),
      ),
    );
  }
}
