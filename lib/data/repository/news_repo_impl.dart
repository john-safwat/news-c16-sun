import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/data_source/articles/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource.dart';
import 'package:news_c16_sun/data/mappers/sources_mpper.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/news_repo.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDatasource remoteDatasource;
  ArticlesRemoteDatasource articlesRemoteDatasource;

  SourcesMapper mapper;

  NewsRepoImpl(this.remoteDatasource, this.mapper , this.articlesRemoteDatasource);

  @override
  Future<List<SourceEntity>> getSources(String categoryId) async {
    var response = await remoteDatasource.getSources(categoryId);
    return mapper.mapSourcesToSourcesEntityList(response);
  }

  @override
  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    var response = await articlesRemoteDatasource.getArticles(sourceId);
    return mapper.mepArticlesToArticlesEntity(response);
  }
}
