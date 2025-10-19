import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c16_sun/data/local_data_base/moedels/source_local_dm.dart';

@injectable
class NewsLocalDataBase {
  late Box<SourceLocalDm> sourcesBox;

  Future<void> openBox() async {
    sourcesBox = await Hive.openBox("sources");
  }

}
