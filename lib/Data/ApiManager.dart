import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/Core/Utils/AppConstant.dart';

import '../Models/articles_model.dart';
import '../Models/source_model.dart';
@singleton
class ApiManager {
   Future<List<Source>> fetchSources(String categoryId) async {
    Uri url = Uri.https(Constant.domain, Constant.sourceEndPoint,
        {"apiKey": Constant.apiKey, "category": categoryId});
    var response = await http.get(url);
   if (response.statusCode==200){
      Map<String, dynamic> data = jsonDecode(response.body);
      SourceModel sourceModel = SourceModel.fromJson(data);
      return sourceModel.sources;
    } else {
      throw Exception("Failed to fetch");
    }
  }

   Future<List<Article>> fetchArticles(
      String sourceId, String language) async {
    Uri url = Uri.https(Constant.domain, Constant.articleEndPoint, {
      "apiKey": Constant.apiKey,
      "sources": sourceId,
      "language": language,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      ArticleModel articleModel = ArticleModel.fromJson(data);
      return articleModel.articles;
    } else {
      throw Exception("Failed to fetch articles");
    }
  }
}
