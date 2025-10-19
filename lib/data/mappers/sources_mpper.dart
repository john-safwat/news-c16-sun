import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:news_c16_sun/domain/entity/article_entity.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

@injectable
class SourcesMapper {
  List<SourceEntity> mapSourcesToSourcesEntityList(List<Sources> sources) {
    return sources.map((e) => SourceEntity(e.id ?? "", e.name ?? "")).toList();
  }

  List<ArticleEntity> mepArticlesToArticlesEntity(
    List<Articles> response,
  ) {
    return response
        .map(
          (e) => ArticleEntity(
            e.author ?? "",
            e.title ?? "",
            e.description ?? "",
            e.url ?? "",
            e.urlToImage ?? "",
            e.publishedAt ?? "",
          ),
        )
        .toList();
  }
}
