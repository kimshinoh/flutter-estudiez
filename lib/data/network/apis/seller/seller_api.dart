import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/seller/sell_request.dart';
import 'package:fruity/dto/seller/seller_response.dart';

class SellerAPI {
  final DioClient _dioClient;

  SellerAPI(this._dioClient);

  Future<ListSellerResponse> getSellers(ListSellerRequest req) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/sellers', queryParameters: req.toJson());

      return ListSellerResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return ListSellerResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return ListSellerResponse.withError(e.toString());
    }
  }

  Future<SellerResponse> getSeller(String id) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/sellers/$id');

      return SellerResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return SellerResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return SellerResponse.withError(e.toString());
    }
  }

  Future<ListProductsBySellerResponse> getProductsBySeller(
    String sellerId,
  ) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/sellers/$sellerId/products');

      return ListProductsBySellerResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return ListProductsBySellerResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return ListProductsBySellerResponse.withError(e.toString());
    }
  }
}
