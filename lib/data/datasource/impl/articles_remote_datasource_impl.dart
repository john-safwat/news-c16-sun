import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/datasource/contract/articles_remote_datasource.dart';
import 'package:news_c16_sun/data/models/articles_response.dart';

@Deprecated("Don't use this impl instead use Articles2RemoteDatasourceImpl")
class ArticlesRemoteDatasourceImpl implements ArticlesRemoteDatasource{
  ApiClient apiClient ;
  ArticlesRemoteDatasourceImpl(this.apiClient);

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