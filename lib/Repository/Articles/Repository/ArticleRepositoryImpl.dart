import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repository/Articles/ArticlesDataSource.dart';
import 'package:news_app/Repository/Articles/ArticlesRepository.dart';

import '../../../Models/articles_model.dart';
@Injectable(as:ArticlesRepository )
class ArticleRepositoryImpl implements ArticlesRepository {
  ArticleRemoteDtaSource articleRemoteDtaSource;
  ArticleLocalDtaSource articleLocalDtaSource;

  ArticleRepositoryImpl(
      {required this.articleRemoteDtaSource,
      required this.articleLocalDtaSource});

  @override
  Future<List<Article>> getArticles(String sourceId, String language) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)){
      var articles= await articleRemoteDtaSource.getArticles(sourceId, language);
      articleLocalDtaSource.saveArticles(articles, sourceId);
      return articles;
    }
    else{
      return articleLocalDtaSource.getArticles(sourceId, language);
    }
  }
}
