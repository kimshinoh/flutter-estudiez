import 'package:fruity/models/category/category.dart';
import 'package:fruity/stores/category/child_categories_store.dart';
import 'package:fruity/stores/category/parent_categories_store.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  ChildCategoryStore childCategoryStore = ChildCategoryStore();
  ParentCategoryStore parentCategoryStore = ParentCategoryStore();

  List<ReactionDisposer> _disposers = [];

  @observable
  late Category? selectedCategory;

  void setupUpdateParent() {
    _disposers = [
      reaction((_) => selectedCategory, (_) async {
        if (selectedCategory != null) {
          childCategoryStore.getCategories(selectedCategory!);
        }
      }),
    ];
  }

  @action
  Future<void> init() async {
    await parentCategoryStore.getCategories();
    selectedCategory = parentCategoryStore.categories.first;
  }

  @action
  void setSelectCategory(Category category) {
    selectedCategory = category;
  }

  @action
  void dispose() {
    for (final ReactionDisposer d in _disposers) {
      d();
    }
    _disposers.clear();
  }
}
