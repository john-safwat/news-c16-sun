import 'package:news_c16_sun/data/datasource/contract/sources_remote_data_source.dart';
import 'package:news_c16_sun/data/mappers/sources_mapper.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';
import 'package:news_c16_sun/domain/repository/sources_repo.dart';

class SourcesRepoImpl implements SourcesRepo {
  SourcesRemoteDataSource remoteDataSource;
  SourcesMapper mapper;

  SourcesRepoImpl(this.remoteDataSource, this.mapper);

  @override
  Future<List<SourceEntity>> getSourcesByCategory(String categoryId) async {
    var response = await remoteDataSource.getSourcesList(categoryId);
    return mapper.mapListOfSourceDtoToSourceEntity(response);
  }
}
