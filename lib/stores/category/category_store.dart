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
  late Category? selectedCategory = null;

  @observable
  late Category? selectedChildCategory = null;

  void setupUpdateParent() {
    _disposers = [
      reaction((_) => selectedCategory, (_) async {
        if (selectedCategory != null) {
          await childCategoryStore.getCategories(selectedCategory!);
          if (childCategoryStore.categories.isNotEmpty) {
            selectedChildCategory = childCategoryStore.categories.first;
          }
        }
      }),
    ];
  }

  @action
  Future<void> init() async {
    if (parentCategoryStore.categories.isEmpty) {
      await parentCategoryStore.getCategories();
      if (parentCategoryStore.categories.isNotEmpty) {
        selectedCategory = parentCategoryStore.categories.first;
        selectedChildCategory = parentCategoryStore.categories.first;
      }
    }
  }

  @action
  void setSelectCategory(Category category) {
    selectedCategory = category;
  }

  @action
  void setSelectChildCategory(Category category) {
    selectedChildCategory = category;
  }

  @action
  void dispose() {
    for (final ReactionDisposer d in _disposers) {
      d();
    }
    _disposers.clear();
  }
}
