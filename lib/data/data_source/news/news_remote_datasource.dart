import 'package:news_c16_sun/core/base/results.dart';
import 'package:news_c16_sun/data/models/sources_response.dart';

abstract interface class NewsRemoteDatasource {

  Future<Results<List<Sources>>> getSources(String categoryId);

}