import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: "https://newsapi.org")
  abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/v2/top-headlines/sources")
  Future<SourcesResponse> getSources(@Query("category") String category);

  @GET("/v2/everything")
  Future<ArticlesResponse> getArticles(@Query("sources") String sources);
}



