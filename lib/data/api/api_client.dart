import 'package:dio/dio.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org")
  abstract class ApiClient {
  // factory ApiClient._(Dio dio) = _ApiClient;
  static ApiClient? _instance;
  static get instance{
    return _instance ??= _ApiClient(buildDioObject());
  }

  @GET("/v2/top-headlines/sources")
  Future<SourcesResponse> getSources(@Query("category") String category);

  @GET("/v2/everything")
  Future<ArticlesResponse> getArticles(@Query("sources") String sources);
}

Dio buildDioObject() {
  Dio dio = Dio();

  dio.options = BaseOptions(
    baseUrl: "https://newsapi.org",
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {"Authorization": "2c58c6392813448996cbedf8b2cd9b2e"},
  );

  dio.interceptors.add(
    PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  return dio;
}
