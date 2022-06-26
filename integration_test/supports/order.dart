import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class Order {
  const Order(this.tester);

  final WidgetTester tester;
  Future<void> openOrderScreen() async {
    final products = find.byIcon(Icons.shopping_basket_outlined);
    await tester.tap(products.first);
    await tester.pumpAndSettle();
  }

  Future<void> makeOrder() async {
    final product = find.byIcon(Icons.add_circle);
    await tester.tap(product.first);
    await tester.pumpAndSettle();
    await tester.pumpUntilFound(tester, find.textContaining('Còn lại'));
    final addProduct = find.byKey(const Key('increase_quantity'));
    await tester.tap(addProduct);
    await tester.pumpAndSettle();
    final addToCartBtn = find.byKey(const Key('buy_now_btn'));
    await tester.tap(addToCartBtn);
    await tester.pumpAndSettle();
    final createOrderBtn = find.byKey(const Key('create_order_btn'));
    await tester.tap(createOrderBtn);
    await tester.pumpAndSettle();
    final buyAgain = find.textContaining('Mua lại');
    expect(buyAgain, findsWidgets);
  }

  Future<void> goDetail() async {
    final product = find.textContaining('Tổng tiền:');
    await tester.tap(product.first);
    await tester.pumpAndSettle();
  }

  Future<void> removeOrder() async {
    final cancelOrderBtn = find.byKey(Key('cancel_order_btn'));
    await tester.tap(cancelOrderBtn);
    await tester.pumpAndSettle();
    final reasonField = find.byKey(const Key('reason_cancel'));
    await tester.enterText(reasonField, 'test');
    await tester.pumpAndSettle();
    final cancelBtn = find.byKey(const Key('confirm_cancel'));
    await tester.tap(cancelBtn);
    await tester.pumpAndSettle();
  }

  Future<void> exit() async {
    final backButton = find.byTooltip('Back');
    await tester.tap(backButton);
    await tester.pumpAndSettle();
  }
}
