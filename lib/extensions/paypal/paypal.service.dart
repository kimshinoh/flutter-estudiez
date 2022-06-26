// ignore_for_file: avoid_dynamic_calls

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http_auth/http_auth.dart';

class PaypalServices {
  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode

  // change clientId and secret with your own, provided by paypal
  String clientId =
      'AQHYXHx9rKwyjqaLetCp2bYj88DDXZIRdcBADXxV6TXsWjovlVhemTcauPhlm7o6vCF2u_PO6E__ywdK';
  String secret =
      'EGA7yd4o3fD_kIZ9u5VpOTEFOWzgg2mdboB8j4-PE7Bsnetot7i4jy9SUQDTaxQK5sgZrfotn2hy5HGh';

  // for getting the access token from Paypal
  Future<String> getAccessToken() async {
    try {
      var client = BasicAuthClient(clientId, secret);
      var response = await client.post(
          Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials'));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"] as String;
      }
      return '';
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>?> createPaypalPayment(
      transactions, String accessToken) async {
    try {
      var response = await http.post(Uri.parse("$domain/v1/payments/payment"),
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && (body['links'].length > 0) as bool) {
          List links = body["links"] as List;

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"] as String;
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"] as String;
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return null;
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String?> executePayment(String
      url, String payerId, String accessToken) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"] as String;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

    Future<int> getCurrencyRate() async {
    try {
      var response = await http.get(Uri.parse(
          'https://free.currconv.com/api/v7/convert?q=USD_VND&compact=ultra&apiKey=aa1181d462e96ce3dbc4'));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["USD_VND"] as int;
      }
      return 1;
    } catch (e) {
      throw e;
    }
  }

}
