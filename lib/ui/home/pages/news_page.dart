import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/data/api/api_manager.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:news_c16_sun/ui/home/widgets/article_card.dart';

class NewsPage extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsPage({required this.categoryDm, super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ArticlesResponse? articlesResponse;
  String? errorMessage;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SourcesResponse?>(
          future: ApiManager().getSource(widget.categoryDm.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              var data = snapshot.data;
              if (data == null) {
                return Center(child: Text("Unable To Load Sources"));
              } else if (data.message != null) {
                return Center(child: Text(data.message!));
              } else {
                if (errorMessage == null && articlesResponse == null) {
                  getArticles(data.sources?[0].id ?? "");
                }
                return DefaultTabController(
                  length: data.sources?.length ?? 0,
                  initialIndex: index,
                  child: TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.all(16),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    onTap: (index){
                      getArticles(data.sources?[index].id ?? "");
                      this.index = index;

                    },
                    tabs:
                        (data.sources ?? [])
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
            }
          },
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, builder) {
              if (errorMessage == null && articlesResponse == null) {
                return Center(child: CircularProgressIndicator());
              } else if (errorMessage != null) {
                return Center(child: Text(errorMessage!));
              } else {
                var data = articlesResponse?.articles ?? [];
                return ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (_, i) => ArticleCard(articles: data[i]),
                  separatorBuilder: (_, _) => SizedBox(height: 16,),
                  itemCount: data.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> getArticles(String source) async {
    try {
      articlesResponse = await ApiManager().getArticles(source);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setState(() {});
    }
  }
}
