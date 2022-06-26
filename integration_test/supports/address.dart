import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class Address {
  const Address(this.tester);

  final WidgetTester tester;
  Future<void> openAddressScreen() async {
    final addressBtn = find.byKey(const Key('address_btn'));
    await tester.tap(addressBtn);
    await tester.pumpAndSettle();
  }

  Future<void> openCreateAddress() async {
    final createAddressBtn = find.byKey(const Key('create_address_btn'));
    await tester.tap(createAddressBtn);
    await tester.pumpAndSettle();
  }

  Future<void> leaveBlankField() async {
    final saveAddressBtn = find.byKey(Key('save_address_btn'));
    expect(saveAddressBtn, findsOneWidget);
  }

  Future<void> exit() async {
    final backButton = find.byTooltip('Back');
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    final backIconMain = find.byTooltip('Back');
    await tester.tap(backIconMain);
    await tester.pumpAndSettle();
  }
}
