import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/repository/news_repo.dart';

@injectable
class GetArticlesBySourceUseCase {
  NewsRepo repo;

  GetArticlesBySourceUseCase(this.repo);

  Future<Results<List<ArticleEntity>>> call(String sourceId) =>
      repo.getArticles(sourceId);
}
