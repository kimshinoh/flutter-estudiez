// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  final _$selectedCategoryAtom =
      Atom(name: '_CategoryStoreBase.selectedCategory');

  @override
  Category? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Category? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$selectedChildCategoryAtom =
      Atom(name: '_CategoryStoreBase.selectedChildCategory');

  @override
  Category? get selectedChildCategory {
    _$selectedChildCategoryAtom.reportRead();
    return super.selectedChildCategory;
  }

  @override
  set selectedChildCategory(Category? value) {
    _$selectedChildCategoryAtom.reportWrite(value, super.selectedChildCategory,
        () {
      super.selectedChildCategory = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CategoryStoreBase.init');

  @override
  Future<void> init(String? categoryId) {
    return _$initAsyncAction.run(() => super.init(categoryId));
  }

  final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase');

  @override
  void setSelectCategory(Category category) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.setSelectCategory');
    try {
      return super.setSelectCategory(category);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectChildCategory(Category category) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.setSelectChildCategory');
    try {
      return super.setSelectChildCategory(category);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
selectedChildCategory: ${selectedChildCategory}
    ''';
  }
}
