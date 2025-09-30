import 'package:dio/dio.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

class ApiManager {
  final dio = Dio();
  final String baseUrl = "newsapi.org";
  final String apiKey = "2c58c6392813448996cbedf8b2cd9b2e";

  Future<SourcesResponse?> getSource(String category) async {
    var url = Uri.https(baseUrl, "v2/top-headlines/sources", {
      "category": category,
    });
    var response = await dio.getUri(
      url,
      options: Options(headers: {"Authorization": apiKey}),
    );
    return SourcesResponse.fromJson(response.data);
  }

  Future<ArticlesResponse?> getArticles(String source) async {
    var url = Uri.https(baseUrl, "v2/everything", {"sources": source});
    var response = await dio.getUri(
      url,
      options: Options(headers: {"Authorization": apiKey}),
    );
    return ArticlesResponse.fromJson(response.data);
  }
}
