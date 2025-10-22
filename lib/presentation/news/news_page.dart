import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c16_sun/core/di/di.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/presentation/home/widgets/article_card.dart';
import 'package:news_c16_sun/presentation/news/news_states.dart';
import 'package:news_c16_sun/presentation/news/news_view_model.dart';

class NewsPage extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsPage({required this.categoryDm, super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsViewModel viewModel = getIt<NewsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.doAction(LoadSourceEvent(widget.categoryDm));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Column(
        children: [
          BlocBuilder<NewsViewModel, NewsStates>(
            builder: (context, state) {
              if (state.errorMessage != null) {
                return Text(state.errorMessage ?? "");
              } else if ((state.sources ?? []).isEmpty) {
                return LinearProgressIndicator();
              } else {
                return DefaultTabController(
                  length: (state.sources ?? []).length,
                  initialIndex: state.selectedIndex ?? 0,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.all(16),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      viewModel.doAction(
                        LoadArticlesEvent((state.sources ?? [])[index]),
                      );
                    },
                    tabs:
                        (state.sources ?? [])
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: BlocBuilder<NewsViewModel, NewsStates>(
              builder: (context, state) {
                if (state.articlesLoading ?? false) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.articlesErrorMessage != null) {
                  return Center(child: Text(state.articlesErrorMessage!));
                } else if ((state.articles ?? []).isEmpty) {
                  return Center(child: Text("There is No Articles Here"));
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder:
                        (context, index) => ArticleCard(
                          articles: (state.articles ?? [])[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: (state.articles ?? []).length,
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
