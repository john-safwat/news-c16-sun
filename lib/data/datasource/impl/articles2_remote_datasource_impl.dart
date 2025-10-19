import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/datasource/contract/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';

class Articles2RemoteDatasourceImpl implements ArticlesRemoteDatasource{
  ApiClient apiClient ;
  Articles2RemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<ArticleDTO>> getArticles(String sourceId) async {
    try{
      var response = await apiClient.getArticles(sourceId);
      return response.articles??[];
    }catch(e){
      rethrow;
    }
  }
}