import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

class NewsStates {
  List<SourceEntity>? sources = [];
  bool? sourcesLoading = false;
  int? selectedIndex = 0;
  String? errorMessage;
  List<ArticleEntity>? articles;
  String? articlesErrorMessage;
  bool? articlesLoading = false;

  NewsStates(
    this.sources,
    this.sourcesLoading,
    this.selectedIndex,
    this.errorMessage,
    this.articles,
    this.articlesErrorMessage,
    this.articlesLoading,
  );

  NewsStates copyWith({
    List<SourceEntity>? sources,
    bool? sourcesLoading,
    int? selectedIndex,
    String? errorMessage,
    List<ArticleEntity>? articles,
    String? articlesErrorMessage,
    bool? articlesLoading,
  }) {
    return NewsStates(
      sources ?? this.sources,
      sourcesLoading ?? this.sourcesLoading,
      selectedIndex ?? this.selectedIndex,
      errorMessage ?? this.errorMessage,
      articles ?? this.articles,
      articlesErrorMessage ?? this.articlesErrorMessage,
      articlesLoading ?? this.articlesLoading,
    );
  }
}

sealed class NewsEvents {}

class LoadSourceEvent extends NewsEvents {
  CategoryDm categoryDm;

  LoadSourceEvent(this.categoryDm);
}

class LoadArticlesEvent extends NewsEvents {
  SourceEntity sourceEntity;

  LoadArticlesEvent(this.sourceEntity);
}
