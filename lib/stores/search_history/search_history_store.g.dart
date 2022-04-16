// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchHistoryStore on _SearchHistoryStoreBase, Store {
  final Atom _$searchsAtom = Atom(name: '_SearchHistoryStoreBase.searchs');

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

  final Atom _$isLoadingAtom = Atom(name: '_SearchHistoryStoreBase.isLoading');

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

  final Atom _$errorAtom = Atom(name: '_SearchHistoryStoreBase.error');

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

  final AsyncAction _$getAllAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final AsyncAction _$addItemAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.addItem');

  @override
  Future<void> addItem(String search) {
    return _$addItemAsyncAction.run(() => super.addItem(search));
  }

  final AsyncAction _$removeItemAsyncAction =
      AsyncAction('_SearchHistoryStoreBase.removeItem');

  @override
  Future<void> removeItem(String search) {
    return _$removeItemAsyncAction.run(() => super.removeItem(search));
  }

  final ActionController _$_SearchHistoryStoreBaseActionController =
      ActionController(name: '_SearchHistoryStoreBase');

  @override
  void clear() {
    final ActionRunInfo _$actionInfo =
        _$_SearchHistoryStoreBaseActionController.startAction(
      name: '_SearchHistoryStoreBase.clear',
    );
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
