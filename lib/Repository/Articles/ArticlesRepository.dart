
import 'package:injectable/injectable.dart';

import '../../Models/articles_model.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles(String sourceId,String language);
}
