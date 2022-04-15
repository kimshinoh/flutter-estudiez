import 'package:collection/collection.dart';
import 'package:fruity/data/local/datasource/search_history_datasource.dart';

import 'package:mobx/mobx.dart';

part 'search_history_store.g.dart';

class SearchHistoryStore = _SearchHistoryStoreBase with _$SearchHistoryStore;

abstract class _SearchHistoryStoreBase with Store {
  late SearchHistoryDataSource _searchHistoryDataSource;
  _SearchHistoryStoreBase(SearchHistoryDataSource searchHistoryDataSource) {
    _searchHistoryDataSource = searchHistoryDataSource;
    searchHistoryDataSource.getAll().then(
          (List<String> value) => {
            searchs = value,
          },
        );
  }

  @observable
  List<String> searchs = [];

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @action
  Future<void> getAll() async {
    _searchHistoryDataSource.getAll().then(
          (List<String> value) => {
            searchs = value,
          },
        );
  }

  @action
  Future<void> addItem(String search) async {
    final String? _existingItem = searchs.firstWhereOrNull(
      (String _search) => _search == search,
    );

    if (_existingItem != null) {
      return;
    } else {
      searchs = searchs..add(search);
      await _searchHistoryDataSource.insert(search);
    }
  }

  @action
  Future<void> removeItem(String search) async {
    searchs = searchs..removeWhere((String element) => element == search);
    _searchHistoryDataSource.delete(search);
  }

  @action
  void clear() {
    searchs = [];
    _searchHistoryDataSource.deleteAll();
  }
}
