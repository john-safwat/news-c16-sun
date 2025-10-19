import 'package:news_c16_sun/data/models/articles_response.dart';

abstract interface class ArticlesRemoteDatasource {
  Future<List<ArticleDTO>> getArticles(String sourceId);
}