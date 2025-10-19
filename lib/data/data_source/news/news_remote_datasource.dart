import 'package:news_c16_sun/data/models/sources_response.dart';

abstract interface class NewsRemoteDatasource {

  Future<List<Sources>> getSources(String categoryId);

}