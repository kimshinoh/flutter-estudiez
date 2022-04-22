import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/data/network/search_dio_client.dart';
import 'package:fruity/dto/product/product_request.dart';
import 'package:fruity/dto/product/product_response.dart';

class SearchAPI {
  final SearchDioClient _dioClient;

  SearchAPI(this._dioClient);

  Future<SearchProductResponseDTO> searchProducts(
      SearchProductRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.post(
        '/products/_search',
        data: <String, dynamic>{
          'size': req.limit,
          'query' : {
            'multi_match' : {
              'query' : req.keyword,
              'fields' : ['name', 'tags']
            }
          }
        },
      );
      return SearchProductResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return SearchProductResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return SearchProductResponseDTO.withError(e.toString());
    }
  }
}
