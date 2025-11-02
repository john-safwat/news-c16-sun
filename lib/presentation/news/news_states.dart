import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

class NewsStates {
  late Results<List<SourceEntity>>? sourcesResults;

  late Results<List<ArticleEntity>>? articlesResults;

  int selectedIndex;

  NewsStates({
    this.sourcesResults,
    this.articlesResults,
    this.selectedIndex = 0,
  });

  NewsStates copyWith({
    Results<List<SourceEntity>>? sourcesResults,
    Results<List<ArticleEntity>>? articlesResults,
    int? selectedIndex,
  }) {
    return NewsStates(
      sourcesResults: sourcesResults ?? this.sourcesResults,
      articlesResults: articlesResults ?? this.articlesResults,
      selectedIndex: selectedIndex ?? this.selectedIndex,
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
