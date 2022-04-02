import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/models/category/category.dart';
import 'package:fruity/stores/category/category_store.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
      child: Observer(builder: (_) {
        return ScrollablePositionedList.builder(
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
                  alignment: 0.5,);
            },
          ),
        );
      },),
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
        child: Observer(builder: (_) {
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
                    image: NetworkImage(category.imageUrl),
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
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
        },),
      ),
    );
  }
}
