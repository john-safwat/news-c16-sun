import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/core/base/app_exceptions.dart';
import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/core/base/safe_call.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/data_source/articles/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';

@Injectable(as: ArticlesRemoteDatasource)
class ArticlesRemoteDatasourceImpl implements ArticlesRemoteDatasource {
  ApiClient apiClient;

  ArticlesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<Results<List<Articles>>> getArticles(String sourceId) async {
    return safeCall(() async {
      var response = await apiClient.getArticles(sourceId);
      if (response.status == "fail") {
        return Failure("Api Fail", ArticlesNotFoundException());
      }
      return Success(response.articles ?? []);
    });
  }
}
