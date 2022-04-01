import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';

AppBar ProductScreenAppBar() {
  final items = ['1', '2'];

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        onPressed: () {},
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
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
      ),
    ),
    actions: [
      IconButton(
        icon: Badge(
          badgeColor: AppColors.palette.shade700,
          badgeContent: items.length > 0
              ? Text(
                  items.length.toString(),
                  style: TextStyle(color: Colors.white),
                )
              : null,
          child: Icon(
            Icons.local_mall_outlined,
            color: Colors.black,
          ),
        ),
        onPressed: () {},
      ),
    ],
  );
}