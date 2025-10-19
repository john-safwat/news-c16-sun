import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/data_source/news/news_remote_datasource.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

@Injectable(as: NewsRemoteDatasource)
class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  ApiClient apiClient;

  NewsRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<Sources>> getSources(String categoryId) async {
    try {
      var response = await apiClient.getSources(categoryId);
      return response.sources ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
