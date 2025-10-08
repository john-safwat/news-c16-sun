import 'package:dio/dio.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@Deprecated("this api manager is deprecated because we have migrated to api client user retrofit api client instead")
class ApiManager {
  late Dio dio = buildDioObject();

  Dio buildDioObject() {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: "https://newsapi.org",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {"Authorization": apiKey}
    );

    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    return dio;
  }

  final String baseUrl = "newsapi.org";
  final String apiKey = "2c58c6392813448996cbedf8b2cd9b2e";

  Future<SourcesResponse?> getSource(String category) async {
    var url = Uri.https(baseUrl, "v2/top-headlines/sources", {
      "category": category,
    });
    var response = await dio.getUri(
      url,
    );
    return SourcesResponse.fromJson(response.data);
  }

  Future<ArticlesResponse?> getArticles(String source) async {
    var url = Uri.https(baseUrl, "v2/everything", {"sources": source});
    var response = await dio.getUri(
      url,
    );
    return ArticlesResponse.fromJson(response.data);
  }
}
