import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/sources_repo.dart';

class GetSourcesListUseCase{
  SourcesRepo repo;

  GetSourcesListUseCase(this.repo);


  Future<List<SourceEntity>> call(String categoryId) {
    return repo.getSourcesByCategory(categoryId);
  }
}