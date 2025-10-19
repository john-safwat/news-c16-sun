import 'package:news_c16_sun/data/models/sources_response.dart';
import 'package:news_c16_sun/domain/entity/source_entity.dart';

class SourcesMapper{
  
  List<SourceEntity> mapListOfSourceDtoToSourceEntity(List<SourceDTO> sourceDto){
    return sourceDto.map((e) => SourceEntity(e.id??"", e.name??"")).toList();
  }

}