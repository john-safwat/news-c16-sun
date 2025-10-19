import 'package:news_c16_sun/data/datasource/contract/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/datasource/contract/sources_remote_data_source.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/repository/articles_repo.dart';

class ArticlesRepoImpl implements ArticlesRepo {
  ArticlesRemoteDatasource articlesRemoteDatasource;

  ArticlesRepoImpl(this.articlesRemoteDatasource);

  @override
  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    var response = await articlesRemoteDatasource.getArticles(sourceId);
    List<ArticleEntity> articles = [];
    for (var articleDto in response) {
      articles.add(
        ArticleEntity(
          articleDto.title ?? "",
          articleDto.urlToImage ?? "",
          articleDto.author ?? "",
          articleDto.description ?? "",
          articleDto.publishedAt ?? "",
        ),
      );
    }
    return articles;
  }
}
