import 'package:flutter/material.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/order/orders_screen.dart';
import 'package:fruity/ui/personal/personal_screen.dart';
import 'package:fruity/ui/product/product_screen.dart';

class MyBottombar extends StatefulWidget {
  const MyBottombar({Key? key}) : super(key: key);

  @override
  State<MyBottombar> createState() => _MyBottombarState();
}

class _MyBottombarState extends State<MyBottombar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductScreen(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    OrdersScreen(),
    PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            activeIcon: Icon(Icons.widgets),
            label: 'Sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            activeIcon: Icon(Icons.shopping_basket),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 20,
        elevation: 0,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}
