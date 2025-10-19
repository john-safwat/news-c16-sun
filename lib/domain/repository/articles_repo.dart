import 'package:news_c16_sun/domain/entity/article_entity.dart';

abstract interface class ArticlesRepo{

  Future<List<ArticleEntity>> getArticles(String sourceId);

}