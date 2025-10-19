
import 'package:hive/hive.dart';
part 'source_local_dm.g.dart';

@HiveType(typeId: 0)
class SourceLocalDm extends HiveObject{
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  SourceLocalDm(this.name , this.id);
}