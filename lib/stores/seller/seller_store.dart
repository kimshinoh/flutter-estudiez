import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/seller/seller_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/seller/sell_request.dart';
import 'package:fruity/dto/seller/seller_response.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:mobx/mobx.dart';
part 'seller_store.g.dart';

class SellerStore = _SellerStoreBase with _$SellerStore;

abstract class _SellerStoreBase with Store {
  final SellerAPI _sellerApi = SellerAPI(DioClient(Dio()));

  @observable
  List<Seller> sellers = [];

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> getSellers(List<String> ids) async {
    try {
      loading = true;
      final ListSellerResponse response =
          await _sellerApi.getSellers(ListSellerRequest(ids: ids));

      if (response.errorMessage != null) {
        error = response.errorMessage!;
        sellers = [];
      } else {
        sellers = response.sellers;
      }
    } catch (e) {
      if (e is NetworkException) {
        error = e.message ?? 'Có lỗi xảy ra';
      } else {
        error = e.toString();
      }
    } finally {
      loading = false;
    }
  }

  @computed
  Map<String, Seller> get sellersMap {
    return sellers.asMap().map((int index, Seller seller) {
      return MapEntry(seller.id, seller);
    });
  }
}
