// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SellerDetailStore on _SellerDetailStoreBase, Store {
  Computed<double>? _$timeDistanceComputed;

  @override
  double get timeDistance =>
      (_$timeDistanceComputed ??= Computed<double>(() => super.timeDistance,
              name: '_SellerDetailStoreBase.timeDistance'))
          .value;
  Computed<String>? _$minutesToStringComputed;

  @override
  String get minutesToString => (_$minutesToStringComputed ??= Computed<String>(
          () => super.minutesToString,
          name: '_SellerDetailStoreBase.minutesToString'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_SellerDetailStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SellerDetailStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$sellerAtom =
      Atom(name: '_SellerDetailStoreBase.seller', context: context);

  @override
  Seller? get seller {
    _$sellerAtom.reportRead();
    return super.seller;
  }

  @override
  set seller(Seller? value) {
    _$sellerAtom.reportWrite(value, super.seller, () {
      super.seller = value;
    });
  }

  late final _$relateProductsAtom =
      Atom(name: '_SellerDetailStoreBase.relateProducts', context: context);

  @override
  List<Product> get relateProducts {
    _$relateProductsAtom.reportRead();
    return super.relateProducts;
  }

  @override
  set relateProducts(List<Product> value) {
    _$relateProductsAtom.reportWrite(value, super.relateProducts, () {
      super.relateProducts = value;
    });
  }

  late final _$locationAtom =
      Atom(name: '_SellerDetailStoreBase.location', context: context);

  @override
  LatLng get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(LatLng value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_SellerDetailStoreBase.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$getSellerAsyncAction =
      AsyncAction('_SellerDetailStoreBase.getSeller', context: context);

  @override
  Future<void> getSeller(String id) {
    return _$getSellerAsyncAction.run(() => super.getSeller(id));
  }

  late final _$getProductsBySellerAsyncAction = AsyncAction(
      '_SellerDetailStoreBase.getProductsBySeller',
      context: context);

  @override
  Future<void> getProductsBySeller(String id) {
    return _$getProductsBySellerAsyncAction
        .run(() => super.getProductsBySeller(id));
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_SellerDetailStoreBase.getLocation', context: context);

  @override
  Future<void> getLocation(String address) {
    return _$getLocationAsyncAction.run(() => super.getLocation(address));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorMessage: ${errorMessage},
seller: ${seller},
relateProducts: ${relateProducts},
location: ${location},
distance: ${distance},
timeDistance: ${timeDistance},
minutesToString: ${minutesToString}
    ''';
  }
}
