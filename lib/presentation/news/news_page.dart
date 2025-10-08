import 'package:flutter/material.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/presentation/home/widgets/article_card.dart';
import 'package:news_c16_sun/presentation/news/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsPage({required this.categoryDm, super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.categoryDm);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Column(
        children: [
          Consumer<NewsViewModel>(
            builder: (context, vm, child) {
              if (viewModel.errorMessage != null) {
                return Text(vm.errorMessage ?? "");
              } else if (viewModel.sources.isEmpty) {
                return LinearProgressIndicator();
              } else {
                return DefaultTabController(
                  length: viewModel.sources.length,
                  initialIndex: viewModel.selectedIndex,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.all(16),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      viewModel.getArticles(viewModel.sources[index]);
                    },
                    tabs:
                        (viewModel.sources)
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e.name ?? ""),
                              ),
                            )
                            .toList(),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: Consumer<NewsViewModel>(
              builder: (context, newsViewModel, child) {
                if(viewModel.articlesLoading){
                  return Center(child: CircularProgressIndicator());
                }
                if (viewModel.articlesErrorMessage != null) {
                  return Center(child: Text(viewModel.articlesErrorMessage!));
                } else if (viewModel.articles.isEmpty) {
                  return Center(child: Text("There is No Articles Here"));
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder:
                        (context, index) =>
                            ArticleCard(articles: viewModel.articles[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: viewModel.articles.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
