import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/search/product_simplify.dart';

class ProductSearch {
  final List<ProductSimplify> products;
  ProductSearch({required this.products});

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
      };
  factory ProductSearch.fromJson(Map<String, dynamic> json) {
    return ProductSearch(
      products: (json['hits']['hits'] as List<dynamic>).map((e) {
        return ProductSimplify.fromJson(e['_source'] as Map<String, dynamic>);
      }).toList(),
    );
  }
}
