import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repository/Articles/ArticlesDataSource.dart';

import '../../../Models/articles_model.dart';
@Injectable(as: ArticleLocalDtaSource)
class ArticleLocalDataSourceImpl implements ArticleLocalDtaSource {
  @override
  Future<List<Article>> getArticles(String sourceId, String language) async {
    var box = await Hive.openBox("articles");
    var data = box.get(sourceId);
    return data;
  }

  @override
  Future<void> saveArticles(List<Article> articles, String sourceId) async {
    var box = await Hive.openBox("articles");
    await box.put(sourceId, articles);
    box.close();
  }
}
