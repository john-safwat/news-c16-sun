import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/use_case/get_articles_by_source_use_case.dart';
import 'package:news_c16_sun/domain/use_case/get_sources_use_case.dart';
import 'package:news_c16_sun/presentation/news/news_states.dart';

@injectable
class NewsViewModel extends Bloc<NewsEvents, NewsStates> {
  GetSourcesUseCase getSourcesUseCase;
  GetArticlesBySourceUseCase getArticlesBySourceUseCase;

  NewsViewModel(this.getSourcesUseCase, this.getArticlesBySourceUseCase)
    : super(
        NewsStates(
          articlesResults: Loading(),
          sourcesResults: Loading(),
          selectedIndex: 0,
        ),
      ) {
    on<LoadSourceEvent>(_loadSources);
    on<LoadArticlesEvent>(_loadArticles);
  }

  Future<void> _loadSources(
    LoadSourceEvent event,
    Emitter<NewsStates> emit,
  ) async {
    var results = await getSourcesUseCase(event.categoryDm.id);
    emit(state.copyWith(sourcesResults: results));
    if (results is Success<List<SourceEntity>>) {
      add(LoadArticlesEvent(results.data!.first));
    }
  }

  Future<void> _loadArticles(
    LoadArticlesEvent event,
    Emitter<NewsStates> emit,
  ) async {
    emit(state.copyWith(articlesResults: Loading()));
    var results = await getArticlesBySourceUseCase(event.sourceEntity.id);
    emit(state.copyWith(articlesResults: results));
  }
}
