import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/base/base_view.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/presentation/home/home_navigator.dart';
import 'package:news_c16_sun/presentation/home/home_view_model.dart';
import 'package:news_c16_sun/presentation/home/pages/categories_page.dart';
import 'package:news_c16_sun/presentation/models/home_pages_types.dart';
import 'package:news_c16_sun/presentation/news/news_page.dart';
import 'package:news_c16_sun/presentation/search/search_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder:
            (context, viewModel, child) => Scaffold(
              drawer: Drawer(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: AppColors.white,
                      child: Center(
                        child: Text(
                          "News App",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      onTap: () {
                        viewModel.changePage(
                          HomePagesTypes.categories,
                          category: null,
                        );
                      },
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                foregroundColor: AppColors.white,
                title: Text(viewModel.appbarTitle),
                actions: [
                  IconButton(
                    onPressed: () {
                      viewModel.navigateToSearchView();
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
                centerTitle: true,
              ),
              body: switch (viewModel.homePagesTypes) {
                HomePagesTypes.categories => CategoriesPage(),
                HomePagesTypes.news => NewsPage(
                  categoryDm: viewModel.categoryDm!,
                ),
              },
            ),
      ),
    );
  }

  @override
  void navigateToSearchView() {
    Navigator.pushNamed(context, SearchView.routeName);
  }

  @override
  HomeViewModel createViewModel() => HomeViewModel();
}
