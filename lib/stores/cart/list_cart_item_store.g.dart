// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_cart_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListCartItemStore on ListCartItemStoreBase, Store {
  final _$itemsAtom = Atom(name: 'ListCartItemStoreBase.items');

  @override
  List<CartItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<CartItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
