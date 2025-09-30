import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/ui/home/widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  final Function(int index , CategoryDm category) onCardClick;
  const CategoriesPage({required this.onCardClick , super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.white),
          );
        } else {
          return CategoryCard(
            category: CategoryDm.categories[index - 1],
            index: (index - 1),
            onCardClick: onCardClick,
          );
        }
      },
      separatorBuilder: (_, _) => SizedBox(height: 16),
      itemCount: CategoryDm.categories.length + 1,
    );
  }
}
