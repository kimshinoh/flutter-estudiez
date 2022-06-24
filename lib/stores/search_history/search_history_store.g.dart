// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchHistoryStore on _SearchHistoryStoreBase, Store {
  late final _$searchsAtom =
      Atom(name: '_SearchHistoryStoreBase.searchs', context: context);

  @override
  List<String> get searchs {
    _$searchsAtom.reportRead();
    return super.searchs;
  }

  @override
  set searchs(List<String> value) {
    _$searchsAtom.reportWrite(value, super.searchs, () {
      super.searchs = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchHistoryStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SearchHistoryStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$addItemAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.addItem', context: context);

  @override
  Future<void> addItem(String search) {
    return _$addItemAsyncAction.run(() => super.addItem(search));
  }

  late final _$removeItemAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.removeItem', context: context);

  @override
  Future<void> removeItem(String search) {
    return _$removeItemAsyncAction.run(() => super.removeItem(search));
  }

  late final _$_SearchHistoryStoreBaseActionController =
      ActionController(name: '_SearchHistoryStoreBase', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_SearchHistoryStoreBaseActionController.startAction(
        name: '_SearchHistoryStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_SearchHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchs: ${searchs},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
