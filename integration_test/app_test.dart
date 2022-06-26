import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruity/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import './pump_until_found.dart';
import 'supports/address.dart';
import 'supports/cart.dart';
import 'supports/login.dart';
import 'supports/order.dart';
import 'supports/search.dart';
import 'supports/user.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Login loginRobot;
  Search searchRobot;
  Address addressRobot;
  Cart cartRobot;
  Order orderRobot;
  User userRobot;
  Future<void> waitingForAppReady(WidgetTester tester) async {
    final loginButton = find.byKey(const Key('login_button'));
    // final loginButton = find.textContaining('Top sản phẩm');
    await tester.pumpUntilFound(tester, loginButton);
  }

// Code ngta tu viet dung co bao ngta nhay ngta dau long`.
  group('End to end Testing', () {
    testWidgets('Whole App testing depend on Testcase',
        (WidgetTester tester) async {
      final FlutterExceptionHandler? originalOnError = FlutterError.onError;
      app.main();
      loginRobot = Login(tester);
      searchRobot = Search(tester);
      addressRobot = Address(tester);
      cartRobot = Cart(tester);
      orderRobot = Order(tester);
      userRobot = User(tester);
      await waitingForAppReady(tester);
      await tester.pumpAndSettle();
      await loginRobot.openLoginForm();
      print('1. Login with blank field');
      await loginRobot.leavePhoneAndCodeBlank();
      print('2. Login with wrong field');
      await loginRobot.wrongPhoneAndCode();
      print('3. Login Successful');
      await loginRobot.normalLogin();
      print('4. Final Login');
      await searchRobot.openSearchScreen();
      print('5. Search with blank field');
      await searchRobot.blankSearchField();
      print('6. Search with normal field');
      await searchRobot.normalSearch();
      await searchRobot.exit();
      print('7. Final Search');
      await addressRobot.openAddressScreen();
      print('8. Address with blank field');
      await addressRobot.openCreateAddress();
      await addressRobot.leaveBlankField();
      print('9. Exit Address Screen');
      await addressRobot.exit();
      print('10. Go to Product Screen');
      await cartRobot.openProductScreen();
      print('11. Add to Cart');
      await cartRobot.selectProduct();
      print('12. Go to Cart Screen');
      await cartRobot.openCartScreen();
      print('13. Remove from Cart');
      await cartRobot.removeCart();
      print('14. Exit Cart Screen');
      await cartRobot.exit();
      print('15. Make Order');
      // await cartRobot.openProductScreen();
      await orderRobot.makeOrder();
      await orderRobot.exit();
      await orderRobot.openOrderScreen();
      print('16. Open detail Order');
      await orderRobot.goDetail();
      print('17. Remove Order');
      await orderRobot.removeOrder();
      print('18. Go to User Screen');
      print('19. Open Profile');
      await userRobot.openUserScreen();
      print('20. Blank Field Check');
      await userRobot.leaveBlankField();
      print('21. Update Infomation');
      await userRobot.changeInfo();
      print('22. Finish Testing');
      sleep(Duration(seconds: 2));
      FlutterError.onError = originalOnError;
    });
  });
}
