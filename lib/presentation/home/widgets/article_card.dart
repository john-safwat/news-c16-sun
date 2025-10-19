import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity articles;

  const ArticleCard({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2381 / 1299,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                placeholder:
                    (_, _) => Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) => Icon(Icons.image),
                imageBuilder:
                    (context, imageProvider) => Image(image: imageProvider),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            articles.title ?? "",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  "by : ${articles.author ?? ""}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                articles.publishedAt ?? "",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
