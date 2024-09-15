import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/ApiManager.dart';
import 'package:news_app/Feature/HomeScreen/Manage/ArticleCubit/ArticleState.dart';
import 'package:news_app/Repository/Articles/ArticlesDataSource.dart';
import 'package:news_app/Repository/Articles/ArticlesRepository.dart';
import 'package:news_app/Repository/Articles/DataSource/ArticleLocalDataSourceImpl.dart';
import 'package:news_app/Repository/Articles/Repository/ArticleRepositoryImpl.dart';
import '../../../../Models/articles_model.dart';
import '../../../../Repository/Articles/DataSource/ArticleRemoteDataSourceImpl.dart';
@injectable
class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({required this.articlesRepository}) : super(LoadingArticleState()) ;

  List<Article> articlesList = [];
  static ArticleCubit get(context)=>BlocProvider.of(context);
  int selectedIndex = 0;
  late ArticlesRepository articlesRepository;
  void fetchArticles(String sourceId, String language) async {
    try {
      emit(LoadingArticleState());
      articlesList = await articlesRepository.getArticles(sourceId, language);
      if (articlesList.isNotEmpty) {
       if(selectedIndex==0){
         emit(SuccessArticleState(articlesList));
       }else{
         emit(ChangeIndexState(index: selectedIndex, articlesList: articlesList));
       }
      } else {
        emit(FailureArticleState(state.toString()));
      }
    } catch (e) {
      emit(FailureArticleState(e.toString()));
    }
  }


}
