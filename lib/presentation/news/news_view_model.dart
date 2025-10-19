import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/datasource/impl/articles_remote_datasource_impl.dart';
import 'package:news_c16_sun/data/datasource/impl/source_remote_datasource_impl.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/data/repository/articles_repo_impl.dart';
import 'package:news_c16_sun/data/repository/sources_repo_impl.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/articles_repo.dart';
import 'package:news_c16_sun/domain/repository/sources_repo.dart';
import 'package:news_c16_sun/domain/use_cases/get_articles_use_case.dart';
import 'package:news_c16_sun/domain/use_cases/get_sources_list_use_case.dart';

import '../../data/datasource/impl/articles2_remote_datasource_impl.dart';

class NewsViewModel extends ChangeNotifier {
  GetSourcesListUseCase getSourcesListUseCase = GetSourcesListUseCase(
      SourcesRepoImpl(
        SourceRemoteDatasourceImpl(ApiClient.instance),
      ));


  GetArticlesUseCase getArticlesUseCase = GetArticlesUseCase(ArticlesRepoImpl(
      Articles2RemoteDatasourceImpl(ApiClient.instance)
  ));
  List<SourceEntity> sources = [];
  bool sourcesLoading = false;
  int selectedIndex = 0;
  String? errorMessage;

  Future<void> loadSources(CategoryDm category) async {
    try {
      var response = await getSourcesListUseCase(category.id);
      sources = response;
      if (sources.isNotEmpty) {
        getArticles(sources.first);
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
      var articlesResponse = await getArticlesUseCase(source.id);
      articles = articlesResponse;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      articlesLoading = false;
      notifyListeners();
    }
  }
}
