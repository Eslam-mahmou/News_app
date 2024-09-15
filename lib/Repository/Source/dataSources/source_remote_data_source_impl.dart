import 'package:injectable/injectable.dart';
import 'package:news_app/Data/ApiManager.dart';

import 'package:news_app/Repository/Source/Source_data_source.dart';

import '../../../Models/source_model.dart';
@Injectable(as:SourceRemoteDataSource )
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<List<Source>> getSources(String categoryId)async {
  var sourceList=await apiManager.fetchSources(categoryId);
  return sourceList;
  }

}
