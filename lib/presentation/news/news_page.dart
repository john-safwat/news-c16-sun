import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/core/di/di.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
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
    viewModel.add(LoadSourceEvent(widget.categoryDm));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Column(
        children: [
          BlocBuilder<NewsViewModel, NewsStates>(
            builder: (context, state) {
              switch (state.sourcesResults!) {
                case Loading<List<SourceEntity>>():
                  {
                    return LinearProgressIndicator();
                  }
                case Success<List<SourceEntity>>():
                  {
                    var sources =
                        (state.sourcesResults as Success<List<SourceEntity>>)
                            .data ??
                        [];
                    return DefaultTabController(
                      length: (sources).length,
                      initialIndex: state.selectedIndex,
                      child: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.all(16),
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        onTap: (index) {
                          viewModel.add(LoadArticlesEvent(sources[index]));
                        },
                        tabs:
                            (sources)
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
                case Failure<List<SourceEntity>>():
                  {
                    var message =
                        (state.sourcesResults as Failure<List<SourceEntity>>)
                            .errorMessage;
                    return Text(message);
                  }
              }
            },
          ),
          Expanded(
            child: BlocBuilder<NewsViewModel, NewsStates>(
              builder: (context, state) {
                switch (state.articlesResults!) {
                  case Loading<List<ArticleEntity>>():
                    {
                      return Center(child: CircularProgressIndicator());
                    }
                  case Success<List<ArticleEntity>>():
                    {
                      var articles =
                          (state.articlesResults
                                  as Success<List<ArticleEntity>>)
                              .data ??
                          [];
                      if ((articles).isEmpty) {
                        return Center(child: Text("There is No Articles Here"));
                      } else {
                        return ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemBuilder:
                              (context, index) =>
                                  ArticleCard(articles: (articles)[index]),
                          separatorBuilder:
                              (context, index) => SizedBox(height: 16),
                          itemCount: (articles).length,
                        );
                      }
                    }
                  case Failure<List<ArticleEntity>>():
                    {
                      var errorMessage =
                          (state.articlesResults
                                  as Failure<List<ArticleEntity>>)
                              .errorMessage;
                      return Center(child: Text(errorMessage));
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
