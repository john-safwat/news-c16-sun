import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/base/base_view_model.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/presentation/home/home_navigator.dart';
import 'package:news_c16_sun/presentation/models/home_pages_types.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<CategoryDm> categories = CategoryDm.categories;
  CategoryDm? categoryDm;
  String appbarTitle = "Home";
  HomePagesTypes homePagesTypes = HomePagesTypes.categories;

  void changePage(HomePagesTypes pageType, {CategoryDm? category}) {
    homePagesTypes = pageType;
    categoryDm = category;
    appbarTitle = switch (pageType) {
      HomePagesTypes.categories => "Home",
      HomePagesTypes.news => category?.name ?? "",
    };
    notifyListeners();
  }

  void navigateToSearchView() {
    navigator!.navigateToSearchView();
  }
}
