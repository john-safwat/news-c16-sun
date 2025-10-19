import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/data_source/articles/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';

@Injectable(as: ArticlesRemoteDatasource)
class ArticlesRemoteDatasourceImpl implements ArticlesRemoteDatasource {
  ApiClient apiClient;

  ArticlesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<Articles>> getArticles(String sourceId) async {
    try {
      var response = await apiClient.getArticles(sourceId);
      return response.articles ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
