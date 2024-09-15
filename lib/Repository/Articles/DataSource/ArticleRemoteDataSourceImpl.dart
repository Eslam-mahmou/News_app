import 'package:injectable/injectable.dart';
import 'package:news_app/Data/ApiManager.dart';
import 'package:news_app/Repository/Articles/ArticlesDataSource.dart';

import '../../../Models/articles_model.dart';
@Injectable(as:ArticleRemoteDtaSource)
class ArticleRemoteDataSourceImpl implements ArticleRemoteDtaSource{
  ApiManager apiManager;
  ArticleRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<List<Article>> getArticles(String sourceId,String language)async {
       var articlesList=await apiManager.fetchArticles(sourceId, language);
       return articlesList;
  }

}