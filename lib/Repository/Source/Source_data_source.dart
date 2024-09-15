import 'package:injectable/injectable.dart';

import '../../Models/source_model.dart';
abstract class SourceRemoteDataSource{
 Future<List<Source>>getSources(String categoryId);
}

abstract class SourceLocalDataSource{
 Future<List<Source>>getSources(String categoryId);
 Future<void> saveSources(List<Source> sources,String category);
}