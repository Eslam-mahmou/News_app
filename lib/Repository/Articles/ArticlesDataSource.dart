


import '../../Models/articles_model.dart';

abstract class ArticleRemoteDtaSource {
  Future<List<Article>> getArticles(String sourceId, String language);
}
abstract class ArticleLocalDtaSource {
  Future<List<Article>> getArticles(String sourceId, String language);

 Future<void> saveArticles(List<Article> articles,String sourceId);
}