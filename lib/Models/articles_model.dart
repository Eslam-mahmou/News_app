import 'package:hive/hive.dart';
part 'articles_model.g.dart';
class ArticleModel {
  final String status;
  List<Article> articles;
  String? code;
  String? message;

  ArticleModel(
      {required this.status, required this.articles, this.code, this.message});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      articles: List.from(json['articles']).map((article){
        return Article.fromJson(article);
      }).toList(),);
}
@HiveType(typeId: 1)
class Article extends HiveObject{
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;

  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['source']['name']??"",
        title: json['title']??"",
        description: json['description']??"",
        url: json['url']??"",
        urlToImage: json['urlToImage']??"",
        publishedAt: json['publishedAt']??"",
    content: json['content']??"");
  }
}
