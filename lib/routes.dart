import 'package:flutter/material.dart';
import 'package:fruity/ui/cart/cart_screen.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/order/order_confirm_screen.dart';
import 'package:fruity/ui/product/product_screen.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String todo = '/todo';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String confirm_order = '/confirm_order';
  static const String search = '/search';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const HomeScreen(),
    product: (BuildContext context) => const ProductScreen(),
    cart: (BuildContext context) => const CartScreen(),
    confirm_order: (BuildContext context) => const ConfirmOrderScreen(),
    search: (BuildContext context) => const SearchScreen(),
  };
}
