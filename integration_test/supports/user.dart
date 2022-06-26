import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class User {
  const User(this.tester);

  final WidgetTester tester;
  Future<void> openUserScreen() async {
    final users = find.byIcon(Icons.person_outline);
    await tester.tap(users.first);
    await tester.pumpAndSettle();
    final setting = find.byKey(const Key('setting_btn'));
    await tester.tap(setting);
    await tester.pumpAndSettle();
  }

  Future<void> leaveBlankField() async {
    final nameField = find.byKey(const Key('name_field'));
    await tester.tap(nameField);
    await simulateKeyRepeatEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(nameField, '');
    await tester.pumpAndSettle();
    final hasError = find.textContaining('Họ và tên không được để trống');
    await tester.pumpUntilFound(tester, hasError);
    expect(hasError, findsOneWidget);
  }

  Future<void> changeInfo() async {
    final nameField = find.byKey(const Key('name_field'));
    await tester.enterText(nameField, 'Nguyen Manh Truong');
    await tester.pumpAndSettle();
    final emailField = find.byKey(const Key('email_field'));
    await tester.enterText(emailField, 'truongmanh0912@gmail.com');
    await tester.pumpAndSettle();
    final saveBtn = find.byKey(const Key('save_profile'));
    await tester.tap(saveBtn);
    await tester.pumpAndSettle();
  }
}
