import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/extensions/paypal/paypal.service.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fruity/stores/order/confirm_order_store.dart';

class PaypalPayment extends StatefulWidget {
  final Function onFinish;
  final OrderConfirmationStore orderDetail;
  const PaypalPayment({required this.orderDetail, required this.onFinish});

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

  Map<String, dynamic> getOrderParams(int currency) {
    final List<CartItem> _items = widget.orderDetail.createOrderStore.items;
    // String totalAmount =
    //     widget.orderDetail.createOrderStore.totalPrice.toString();
    List items = [];
    // convert _item to item
    // for (CartItem item in _items) {
    //   items.add({
    //     "name": item.name,
    //     "quantity": item.quantity,
    //     "price": item.price.toString(),
    //     "currency": defaultCurrency["currency"]
    //   });
    // }
    String convertToUsd =
        (widget.orderDetail.createOrderStore.totalPrice / currency).toStringAsFixed(2);
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
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains(returnURL)) {
                  final uri = Uri.parse(request.url);
                  final payerID = uri.queryParameters['PayerID'];
                  if (payerID != null) {
                    services
                        .executePayment(executeUrl, payerID, accessToken)
                        .then((id) {
                      widget.onFinish(id);
                      Navigator.of(context).pop();
                    });
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
