import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/data/data_source/articles/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource.dart';
import 'package:news_c16_sun/data/mappers/sources_mpper.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/news_repo.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDatasource remoteDatasource;
  ArticlesRemoteDatasource articlesRemoteDatasource;

  SourcesMapper mapper;

  NewsRepoImpl(
    this.remoteDatasource,
    this.mapper,
    this.articlesRemoteDatasource,
  );

  @override
  Future<Results<List<SourceEntity>>> getSources(String categoryId) async {
    var response = await remoteDatasource.getSources(categoryId);
    return switch (response) {
      Loading<List<Sources>>() => Loading(),
      Success<List<Sources>>() => Success(
        mapper.mapSourcesToSourcesEntityList(response.data ?? []),
      ),
      Failure<List<Sources>>() => Failure(
        response.errorMessage,
        response.exception,
      ),
    };
  }

  @override
  Future<Results<List<ArticleEntity>>> getArticles(String sourceId) async {
    var response = await articlesRemoteDatasource.getArticles(sourceId);
    return switch (response) {
      Loading<List<Articles>>() => Loading(),

      Success<List<Articles>>() => Success(
        mapper.mepArticlesToArticlesEntity(response.data ?? []),
      ),
      Failure<List<Articles>>() => Failure(
        response.errorMessage,
        response.exception,
      ),
    };
  }
}
