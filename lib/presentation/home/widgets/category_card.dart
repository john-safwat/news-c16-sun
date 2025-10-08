import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';

class CategoryCard extends StatelessWidget {
  final int index;

  final CategoryDm category;
  final Function() onCardClick;

  const CategoryCard({
    required this.category,
    required this.index,
    required this.onCardClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var even = index % 2 == 0;
    return InkWell(
      onTap: () {
        onCardClick();
      },
      child: AspectRatio(
        aspectRatio: 2381 / 1299,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(category.image)),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment:
                even ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withAlpha(70),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (even)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("View All"),
                      ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        even
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios_new,
                        color: AppColors.white,
                      ),
                    ),
                    if (!even)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("View All"),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
