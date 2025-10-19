import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

abstract interface class NewsRepo {
  Future<List<SourceEntity>> getSources(String categoryId);
  Future<List<ArticleEntity>> getArticles(String sourceId);
}
