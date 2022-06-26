import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class Cart {
  const Cart(this.tester);

  final WidgetTester tester;
  Future<void> openProductScreen() async {
    final products = find.byIcon(Icons.widgets_outlined);
    await tester.tap(products.first);
    await tester.pumpAndSettle();
    await tester.pumpUntilFound(tester, find.byIcon(Icons.add_circle));
  }

  Future<void> selectProduct() async {
    final product = find.byIcon(Icons.add_circle);
    await tester.tap(product.first);
    await tester.pumpAndSettle();
    await tester.pumpUntilFound(tester, find.textContaining('Còn lại'));
    final addProduct = find.byKey(const Key('increase_quantity'));
    await tester.tap(addProduct);
    await tester.pumpAndSettle();
    final addToCartBtn = find.byKey(Key('add_to_cart'));
    await tester.tap(addToCartBtn);
    await tester.pumpAndSettle();
  }

  Future<void> openCartScreen() async {
    final cartBtn = find.byKey(const Key('cart_btn'));
    await tester.tap(cartBtn);
    await tester.pumpAndSettle();
    final product = find.text('Chọn mua');
    expect(product, findsWidgets);
  }

  Future<void> makeOrder() async {
    final product = find.text('Chọn mua');
    await tester.tap(product.first);
    await tester.pumpAndSettle();
  }

  Future<void> removeCart() async {
    final removeBtn = find.byIcon(Icons.close);
    sleep(Duration(seconds: 2));
    await tester.tap(removeBtn.first);
    await tester.pumpAndSettle();
  }

  Future<void> exit() async {
    final backButton = find.byTooltip('Back');
    await tester.tap(backButton);
    await tester.pumpAndSettle();
  }
}
