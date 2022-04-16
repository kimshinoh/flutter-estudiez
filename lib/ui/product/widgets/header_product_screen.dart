import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/widgets/cart_button.dart';

AppBar ProductScreenAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Builder(
      builder: (BuildContext context) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.search,
            );
          },
          child: Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    'Thực phẩm thiết yếu - Giãn cách an toàn',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ),
    actions: [
      CartButton(
        iconColor: Colors.black,
        badgeColor: AppColors.palette.shade500,
      ),
    ],
  );
}
