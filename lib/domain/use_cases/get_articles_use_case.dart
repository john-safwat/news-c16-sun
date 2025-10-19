import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/repository/articles_repo.dart';

class GetArticlesUseCase{
  ArticlesRepo repo;
  GetArticlesUseCase(this.repo);

  Future<List<ArticleEntity>> call(String sourceId) {
    return repo.getArticles(sourceId);
  }
}