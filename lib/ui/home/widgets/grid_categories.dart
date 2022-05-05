import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/models/category/category.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/category/parent_categories_store.dart';
import 'package:fruity/ui/product/product_screen.dart';
import 'package:provider/provider.dart';

class GridCategory extends StatelessWidget {
  const GridCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParentCategoryStore _parentCategoryStore = ParentCategoryStore();
    _parentCategoryStore.getCategories();

    return Provider(
      create: (_) => _parentCategoryStore,
      child: _body(),
    );
  }
}

class _body extends StatelessWidget {
  const _body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParentCategoryStore _parentCategoryStore =
        Provider.of<ParentCategoryStore>(context);

    return Observer(
      builder: (_) {
        if (_parentCategoryStore.loading) {
          return Container();
        }

        return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  ..._parentCategoryStore.categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _categoryItem(category: category),
                    );
                  }).toList()
                ],
              ),
            ));
      },
    );
  }
}

class _categoryItem extends StatelessWidget {
  Category category;

  _categoryItem({Key? key, required this.category}) : super(key: key);
  final double heightIcon = 50;
  final double widthIcon = 50;
  final double textSize = 13;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.product,
            arguments: ProductScreenAgruments(categoryId: category.id));
      },
      child: Column(
        children: [
          Image.network(
            category.imageUrl ?? "https://via.placeholder.com/150",
            width: widthIcon,
            height: heightIcon,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
