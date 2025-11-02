import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

abstract interface class NewsRepo {
  Future<Results<List<SourceEntity>>> getSources(String categoryId);
  Future<Results<List<ArticleEntity>>> getArticles(String sourceId);
}
