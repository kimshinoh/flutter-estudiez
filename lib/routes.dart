import 'package:flutter/material.dart';
import 'package:fruity/ui/cart/cart_screen.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/order/order_confirm_screen.dart';
import 'package:fruity/ui/order/order_detail_screen.dart';
import 'package:fruity/ui/order/orders_screen.dart';
import 'package:fruity/ui/personal/setting_screen.dart';
import 'package:fruity/ui/personal/user_profile_screen.dart';
import 'package:fruity/ui/product/product_detail_screen.dart';
import 'package:fruity/ui/product/product_screen.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/splash/splash.dart';
import 'package:fruity/ui/user_address/create_user_address_screen.dart';
import 'package:fruity/ui/user_address/list_user_address_screen.dart';
import 'package:fruity/ui/user_address/update_user_address_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';

  static const String cart = '/cart';
  static const String search = '/search';

  // product
  static const String product = '/product';
  static const String product_detail = '/product_detail';

  // user
  static const String user_profile = '/user_profile';
  static const String setting = '/setting';

  // order
  static const String confirm_order = '/confirm_order';
  static const String orders = '/orders';
  static const String view_order = '/view_order';

  // user address
  static const String list_user_addressres = '/list_user_addressres';
  static const String create_user_address = '/create_user_address';
  static const String update_user_address = '/update_user_address';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const HomeScreen(),
    cart: (BuildContext context) => const CartScreen(),
    search: (BuildContext context) => const SearchScreen(),

    // product
    product: (BuildContext context) => const ProductScreen(),
    product_detail: (BuildContext context) => const ProductDetailScreen(),

    //order

    orders: (BuildContext context) => const OrdersScreen(),
    view_order: (BuildContext context) => OrderDetailScreen(),
    confirm_order: (BuildContext context) => const ConfirmOrderScreen(),

    // user address
    list_user_addressres: (BuildContext context) =>
        const ListUserAddressScreen(),
    create_user_address: (BuildContext context) =>
        const CreateUserAddressScreen(),
    update_user_address: (BuildContext context) =>
        const UpdateUserAddressScreen(),

    // user
    user_profile: (BuildContext context) => const UserProfileScreen(),
    setting: (BuildContext context) => const SettingScreen(),
  };
}
