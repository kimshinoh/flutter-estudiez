import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/product/product_request.dart';
import 'package:fruity/dto/product/product_response.dart';

class ProductAPI {
  final DioClient _dioClient;

  ProductAPI(this._dioClient);

  Future<ListProductsResponseDTO> getTopSaleProducts(
      ListProductRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/products/get-top-sale',
        queryParameters: req.toJson(),
      );
      return ListProductsResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return ListProductsResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return ListProductsResponseDTO.withError(e.toString());
    }
  }

  Future<SaleOffProductResponseDTO> getSaleOffProducts(
      SaleOffProductRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/products/get-sale-off',
        queryParameters: req.toJson(),
      );
      return SaleOffProductResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return SaleOffProductResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return SaleOffProductResponseDTO.withError(e.toString());
    }
  }

  Future<SaleShockReponseDTO> getSaleShockProducts(
      SaleShockRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/products/get-sale-shock',
        queryParameters: req.toJson(),
      );
      return SaleShockReponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return SaleShockReponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return SaleShockReponseDTO.withError(e.toString());
    }
  }

  Future<ProductsByIdsResponseDTO> getProductsByIds(
      ProductsByIdsRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/products/get-by-ids',
        queryParameters: req.toJson(),
      );
      return ProductsByIdsResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return ProductsByIdsResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return ProductsByIdsResponseDTO.withError(e.toString());
    }
  }
}
