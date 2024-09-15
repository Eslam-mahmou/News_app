import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repository/Source/sourceRepository.dart';
import 'package:news_app/Repository/Source/Source_data_source.dart';
import '../../../Models/source_model.dart';
@Injectable(as: SourceRepository)
class SourceRepositoryImpl extends SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceLocalDataSource sourceLocalDataSource;

  SourceRepositoryImpl(
      {required this.sourceRemoteDataSource,
      required this.sourceLocalDataSource});

  @override
  Future<List<Source>> getSources(String categoryId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile) ) {
      List<Source> sources = await sourceRemoteDataSource.getSources(categoryId);
      sourceLocalDataSource.saveSources(sources,categoryId);
      return sources;
    } else {
      return  sourceLocalDataSource.getSources(categoryId);
    }
  }
}
