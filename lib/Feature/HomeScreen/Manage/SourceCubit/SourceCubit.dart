import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/ApiManager.dart';
import 'package:news_app/Feature/HomeScreen/Manage/SourceCubit/SourceState.dart';
import 'package:news_app/Repository/Source/Repository/SourceRepositryImpl.dart';
import 'package:news_app/Repository/Source/dataSources/source_local_data_source_impl.dart';
import 'package:news_app/Repository/Source/sourceRepository.dart';
import 'package:news_app/Repository/Source/Source_data_source.dart';

import '../../../../Models/source_model.dart';
import '../../../../Repository/Source/dataSources/source_remote_data_source_impl.dart';
@injectable
class SourceCubit extends Cubit<SourceState> {
  SourceCubit({required this.sourceRepository}) : super(LoadingSourceState());
  List<Source> sourcesList = [];
   SourceRepository sourceRepository;


  Future<void> getSources(String categoryId) async {
    try {
      emit(LoadingSourceState());
      sourcesList = await sourceRepository.getSources(categoryId);
      emit(SuccessSourceState(sourcesList));
    } catch (e) {
      emit(FailureSourceState(e.toString()));
    }
  }
}
