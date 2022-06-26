import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../pump_until_found.dart';

class Login {
  const Login(this.tester);

  final WidgetTester tester;
  Future<void> openLoginForm() async {
    final loginButton = find.byKey(const Key('login_button'));
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
  }

  Future<void> leavePhoneAndCodeBlank() async {
    final loginBtn = find.byKey(const Key('login'));
    expect(loginBtn, findsOneWidget);
  }

  Future<void> wrongPhoneAndCode() async {
    final phoneNumberField = find.byKey(const Key('phone_number'));
    final codeField = find.byKey(const Key('secure_code'));
    await tester.enterText(phoneNumberField, '123456');
    await tester.enterText(codeField, '123456');
    await tester.pumpAndSettle();
    expect(find.text('Số điện thoại không hợp lệ'), findsOneWidget);
  }

  Future<void> normalLogin() async {
    final phoneNumberField = find.byKey(const Key('phone_number'));
    final codeField = find.byKey(const Key('secure_code'));
    final sendCodeBtn = find.byKey(const Key('send_sms_code'));
    final loginBtn = find.byKey(const Key('login'));
    await tester.enterText(phoneNumberField, '0705133876');
    await tester.pumpAndSettle();
    await tester.tap(sendCodeBtn);
    await tester.pumpAndSettle();
    await tester.enterText(codeField, '000000');
    await tester.pumpAndSettle();
    await tester.tap(loginBtn);
    await tester.pumpAndSettle();
  }
}
