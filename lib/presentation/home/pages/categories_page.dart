import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/presentation/home/home_view_model.dart';
import 'package:news_c16_sun/presentation/home/widgets/category_card.dart';
import 'package:news_c16_sun/presentation/models/home_pages_types.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder:
          (context, viewModel, child) => ListView.separated(
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
                  onCardClick: () {
                    viewModel.changePage(
                      HomePagesTypes.news,
                      category: viewModel.categories[index - 1],
                    );
                  },
                );
              }
            },
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: CategoryDm.categories.length + 1,
          ),
    );
  }
}
