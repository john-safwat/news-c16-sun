import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/base_view_model.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/use_case/get_articles_by_source_use_case.dart';
import 'package:news_c16_sun/domain/use_case/get_sources_use_case.dart';

@injectable
class NewsViewModel extends BaseViewModel {
  GetSourcesUseCase getSourcesUseCase;
  GetArticlesBySourceUseCase getArticlesBySourceUseCase;

  NewsViewModel(this.getSourcesUseCase, this.getArticlesBySourceUseCase);

  List<SourceEntity> sources = [];
  bool sourcesLoading = false;
  int selectedIndex = 0;
  String? errorMessage;

  Future<void> loadSources(CategoryDm category) async {
    try {
      var response = await getSourcesUseCase(category.id);
      if (response.isNotEmpty) {
        sources = response;
        getArticles(response[0]);
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  List<ArticleEntity> articles = [];
  String? articlesErrorMessage;
  bool articlesLoading = false;

  Future<void> getArticles(SourceEntity source) async {
    articlesLoading = true;
    notifyListeners();
    try {
      var articlesResponse = await getArticlesBySourceUseCase(source.id);
      if (articlesResponse.isNotEmpty) {
        articles = articlesResponse;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      articlesLoading = false;
      notifyListeners();
    }
  }
}
