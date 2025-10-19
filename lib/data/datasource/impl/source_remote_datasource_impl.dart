import 'package:news_c16_sun/data/api/api_client.dart';
import 'package:news_c16_sun/data/datasource/contract/sources_remote_data_source.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

class SourceRemoteDatasourceImpl implements SourcesRemoteDataSource{
  ApiClient apiClient;
  SourceRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<SourceDTO>> getSourcesList(String categoryId) async {
    try{
      var response = await apiClient.getSources(categoryId);
      return response.sources??[];
    }catch(e){
      rethrow;
    }
  }

}