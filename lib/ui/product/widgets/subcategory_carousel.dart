import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/category/category.dart';
import 'package:fruity/stores/category/category_store.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class SubcategoryCarousel extends StatelessWidget {
  const SubcategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryStore _categoryStore = context.read<CategoryStore>();

    final double height = MediaQuery.of(context).size.height;

    return Observer(
      builder: (BuildContext context) {
        return SizedBox(
          width: 75,
          height: height,
          child: Skeleton(
            isLoading: _categoryStore.childCategoryStore.loading,
            skeleton: const _SubcategoryCarouselSkeleton(),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 1,
                height: 1,
              ),
              itemCount: _categoryStore.childCategoryStore.categories.length,
              itemBuilder: (BuildContext context, int index) {
                final Category category =
                    _categoryStore.childCategoryStore.categories[index];
                return _SubcategoryItem(
                  category: category,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _SubcategoryItem extends StatelessWidget {
  Category category;

  _SubcategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryStore _categoryStore = context.read<CategoryStore>();

    return SizedBox(
      height: 45,
      child: InkWell(
        onTap: () {
          // scrollTo();
          _categoryStore.setSelectChildCategory(category);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                return Container(
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                    color:
                        _categoryStore.selectedChildCategory!.id == category.id
                            ? AppColors.palette.shade500
                            : Colors.transparent,
                  ),
                );
              },
            ),
            Observer(
              builder: (_) {
                return Expanded(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: _categoryStore.selectedChildCategory!.id ==
                              category.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 12,
                      color: _categoryStore.selectedChildCategory!.id ==
                              category.id
                          ? AppColors.palette.shade500
                          : Colors.black,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SubcategoryCarouselSkeleton extends StatelessWidget {
  const _SubcategoryCarouselSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
        height: 1,
      ),
      itemBuilder: (BuildContext context, int index) => Container(
          height: 45,
          alignment: Alignment.center,
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle:
                    SkeletonLineStyle(height: 10, alignment: Alignment.center)),
          )),
      itemCount: 15,
    );
  }
}
