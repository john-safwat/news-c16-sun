import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

class NewsViewModel extends ChangeNotifier {
  ApiClient apiClient = ApiClient.instance;

  List<Sources> sources = [];
  bool sourcesLoading = false;
  int selectedIndex = 0;
  String? errorMessage;

  Future<void> loadSources(CategoryDm category) async {
    try {
      var response = await apiClient.getSources(category.id);
      if (response.message != null) {
        errorMessage = response.message;
      } else {
        sources = response.sources ?? [];
        if (sources.isNotEmpty) {
          getArticles(sources.first);
        }
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  List<Articles> articles = [];
  String? articlesErrorMessage;
  bool articlesLoading = false;

  Future<void> getArticles(Sources source) async {
    articlesLoading = true;
    notifyListeners();
    try {
      var articlesResponse = await apiClient.getArticles(source.id ?? "");
      if (articlesResponse.message != null) {
        errorMessage = articlesResponse.message;
      } else {
        articles = articlesResponse.articles ?? [];
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      articlesLoading = false;
      notifyListeners();
    }
  }
}
