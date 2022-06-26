import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/extensions/paypal/paypal.service.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class PaypalPayment extends StatefulWidget {
  final OrderConfirmationStore orderDetail;
  final UserAddress address;
  const PaypalPayment({required this.address, required this.orderDetail});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String checkoutUrl = '';
  late String executeUrl = '';
  late String accessToken = '';
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        int currency = await services.getCurrencyRate();
        final transactions = getOrderParams(currency);
        print(transactions);
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        print(res);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"] as String;
            executeUrl = res["executeUrl"] as String;
          });
          print(checkoutUrl);
        }
      } catch (e) {
        print('exception: ' + e.toString());
      }
    });
  }

  // item name, price and quantity
  String itemName = 'iPhone X';
  String itemPrice = '1.99';
  int quantity = 1;

  Map<String, dynamic> getOrderParams(int currency) {
    final List<CartItem> _items = widget.orderDetail.createOrderStore.items;
    // String totalAmount =
    //     widget.orderDetail.createOrderStore.totalPrice.toString();
    List items = [];
    String convertToUsd =
        (widget.orderDetail.createOrderStore.totalPrice / currency)
            .toStringAsFixed(2);
    print(convertToUsd);
    String totalAmount = convertToUsd;
    String subTotalAmount = convertToUsd;
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = '';
    String userLastName = '';
    String addressCity = '';
    String addressStreet = '';
    String addressZipCode = '';
    String addressCountry = '';
    String addressState = '';
    String addressPhoneNumber = '+705133876';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    final CartStore _cartStore = context.read<CartStore>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Paypal Payment',
        ),
      ),
      body: checkoutUrl == ''
          ? Center(child: CircularProgressIndicator())
          : WebView(
              initialUrl: checkoutUrl,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) async {
                if (request.url.contains(returnURL)) {
                  final uri = Uri.parse(request.url);
                  final payerID = uri.queryParameters['PayerID'];
                  if (payerID != null) {
                    var id = await services.executePayment(
                        executeUrl, payerID, accessToken);

                    await widget.orderDetail.createOrderStore
                        .createOrder(widget.address);
                    if (widget.orderDetail.createOrderStore.errorMessage !=
                        null) {
                      NotifyHelper.error(
                          context,
                          widget.orderDetail.createOrderStore.errorMessage ??
                              '');
                    } else {
                      Navigator.of(context).pop();
                      await _cartStore.removeItems(
                        widget.orderDetail.createOrderStore.items,
                      );

                      widget.orderDetail.createOrderStore.clear();

                      Navigator.popAndPushNamed(context, Routes.orders);
                      Future.delayed(Duration.zero, () {
                        NotifyHelper.success(
                            context, 'Tạo đơn hàng thành công!');
                      });
                    }
                  } else {
                    Navigator.of(context).pop();
                  }
                  Navigator.of(context).pop();
                }
                if (request.url.contains(cancelURL)) {
                  Navigator.of(context).pop();
                }
                return NavigationDecision.navigate;
              },
            ),
    );
  }
}
