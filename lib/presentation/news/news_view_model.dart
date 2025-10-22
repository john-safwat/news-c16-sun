import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/use_case/get_articles_by_source_use_case.dart';
import 'package:news_c16_sun/domain/use_case/get_sources_use_case.dart';
import 'package:news_c16_sun/presentation/news/news_states.dart';

@injectable
class NewsViewModel extends Cubit<NewsStates> {
  GetSourcesUseCase getSourcesUseCase;
  GetArticlesBySourceUseCase getArticlesBySourceUseCase;

  NewsViewModel(this.getSourcesUseCase, this.getArticlesBySourceUseCase)
    : super(NewsStates([], false, 0, null, [], null, false));

  Future<void> doAction(NewsEvents event) async {
    switch (event) {
      case LoadSourceEvent():
        {
          _loadSources(event.categoryDm);
        }
      case LoadArticlesEvent():
        {
          _getArticles(event.sourceEntity);
        }
    }
  }

  Future<void> _loadSources(CategoryDm category) async {
    try {
      var response = await getSourcesUseCase(category.id);
      if (response.isNotEmpty) {
        emit(state.copyWith(sources: response));
        _getArticles(response[0]);
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _getArticles(SourceEntity source) async {
    emit(state.copyWith(articlesLoading: true));
    try {
      var articlesResponse = await getArticlesBySourceUseCase(source.id);
      if (articlesResponse.isNotEmpty) {
        emit(
          state.copyWith(articles: articlesResponse, articlesLoading: false),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          articlesErrorMessage: e.toString(),
          articlesLoading: false,
        ),
      );
    }
  }
}
