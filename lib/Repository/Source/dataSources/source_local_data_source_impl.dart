
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repository/Source/Source_data_source.dart';

import '../../../Models/source_model.dart';
@Injectable(as:SourceLocalDataSource )
class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<List<Source>>getSources(String categoryId) async {
    var box = await Hive.openBox("tabs");
    var data = box.get(categoryId);
    return data;
  }

  @override
 Future<void> saveSources(List<Source> sources,String category) async {
    var box = await Hive.openBox("tabs");
    await box.put(category, sources);
    box.close();
  }
}
