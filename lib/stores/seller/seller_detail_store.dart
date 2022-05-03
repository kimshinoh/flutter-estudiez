import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/seller/seller_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/seller/seller_response.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/utils/location_util.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'seller_detail_store.g.dart';

class SellerDetailStore = _SellerDetailStoreBase with _$SellerDetailStore;

abstract class _SellerDetailStoreBase with Store {
  final SellerAPI _sellerApi = SellerAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposers = [];

  void setupUpdateSeller() {
    _disposers.add(
      reaction(
        (_) => seller,
        (Seller? seller) {
          if (seller != null) {
            getProductsBySeller(seller.id);
            getLocation(
              seller.headQuarter,
            );
          }
        },
      ),
    );
  }

  @observable
  bool loading = false;
  @observable
  String? errorMessage;

  @observable
  Seller? seller;

  @action
  Future<void> getSeller(String id) async {
    try {
      loading = true;
      final SellerResponse response = await _sellerApi.getSeller(id);

      if (response.errorMessage != null) {
        errorMessage = response.errorMessage;
        seller = null;
      } else {
        seller = response.seller;
      }
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
    } finally {
      loading = false;
    }
  }

  @observable
  List<Product> relateProducts = [];

  @action
  Future<void> getProductsBySeller(String id) async {
    try {
      final ListProductsBySellerResponse response =
          await _sellerApi.getProductsBySeller(id);
      if (response.errorMessage != null) {
        errorMessage = response.errorMessage;
        relateProducts = [];
      } else {
        relateProducts = response.products;
      }
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
    } finally {}
  }

  @observable
  LatLng location = LatLng(0, 0);

  @observable
  double distance = 0;

  static double v = 30;

  @computed
  double get timeDistance => (distance / v) * 60;

  @computed
  String get minutesToString {
    final int minutes = timeDistance.toInt();
    final int hours = minutes ~/ 60;
    final int minutesLeft = minutes % 60;
    if (hours == 0) {
      return '${minutesLeft} phút';
    } else {
      return '${hours} giờ ${minutesLeft} phút';
    }
  }

  @action
  Future<void> getLocation(
    String address,
  ) async {
    final Location _location = await LocationHelper.determineLocation(address);
    location = LatLng(_location.latitude, _location.longitude);

    final Position myPosition = await LocationHelper.myLocation();

    distance = LocationHelper.calculateDistance(
      myPosition.latitude,
      myPosition.longitude,
      _location.latitude,
      _location.longitude,
    );
  }
}
