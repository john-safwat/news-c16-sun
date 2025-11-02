import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';

abstract  interface class ArticlesRemoteDatasource{

  Future<Results<List<Articles>>> getArticles(String sourceId);

}