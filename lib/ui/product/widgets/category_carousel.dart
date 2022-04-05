import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/category/category.dart';
import 'package:fruity/stores/category/category_store.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:skeletons/skeletons.dart';

class CategoryCarousel extends StatefulWidget {
  const CategoryCarousel({Key? key}) : super(key: key);

  @override
  State<CategoryCarousel> createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  late CategoryStore _categoryStore;
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryStore = context.read<CategoryStore>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Observer(
        builder: (_) {
          return Skeleton(
            isLoading: _categoryStore.parentCategoryStore.loading,
            skeleton: const _CategoryListSkeleton(),
            child: ScrollablePositionedList.builder(
              itemCount: _categoryStore.parentCategoryStore.categories.length,
              itemScrollController: itemScrollController,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => _CategoryItem(
                category: _categoryStore.parentCategoryStore.categories[index],
                scrollTo: () {
                  itemScrollController.scrollTo(
                    index: index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: 0.5,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  VoidCallback scrollTo;
  _CategoryItem({Key? key, required this.category, required this.scrollTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryStore _categoryStore = context.read<CategoryStore>();

    return Container(
      width: 80,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          scrollTo();
          _categoryStore.setSelectCategory(category);
        },
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(category.imageUrl ??
                          'https://via.placeholder.com/150',),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (category.id == _categoryStore.selectedCategory!.id)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.palette.shade500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3,),
                      child: Text(
                        category.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 60,
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                    ),
                    child: Text(
                      category.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CategoryListSkeleton extends StatelessWidget {
  const _CategoryListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        width: 70,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                height: 60,
                width: 60,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SkeletonParagraph(
              style: const SkeletonParagraphStyle(
                lines: 1,
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                ),
                lineStyle: SkeletonLineStyle(height: 10),
              ),
            )
          ],
        ),
      ),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }
}
