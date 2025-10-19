import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

abstract interface class SourcesRepo {

  Future<List<SourceEntity>> getSourcesByCategory(String categoryId );

}