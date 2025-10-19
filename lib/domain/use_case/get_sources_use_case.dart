import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/news_repo.dart';

@injectable
class GetSourcesUseCase {
  NewsRepo repo;

  GetSourcesUseCase(this.repo);

  Future<List<SourceEntity>> call(String categoryId) {
    return repo.getSources(categoryId);
  }
}
