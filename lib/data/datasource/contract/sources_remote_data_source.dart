import 'package:news_c16_sun/data/models/sources_response.dart';

abstract interface class SourcesRemoteDataSource {

  Future<List<SourceDTO>> getSourcesList(String categoryId);

}