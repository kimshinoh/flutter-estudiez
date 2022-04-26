import 'package:flutter/material.dart';

class SellerLogo extends StatelessWidget {
  Size size;
  String logoUrl;
  SellerLogo({Key? key, required this.size, required this.logoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Image(
          image: NetworkImage(logoUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
