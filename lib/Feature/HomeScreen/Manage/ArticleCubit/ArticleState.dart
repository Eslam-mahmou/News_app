import '../../../../Models/articles_model.dart';

abstract class ArticleState {}

class LoadingArticleState extends ArticleState {}

class SuccessArticleState extends ArticleState {
  final List<Article> articlesList;

  SuccessArticleState(this.articlesList);
}

class FailureArticleState extends ArticleState {
  final String errorMessage;

  FailureArticleState(this.errorMessage);
}

class ChangeIndexState extends ArticleState {
  final int index;
  final List<Article> articlesList;

  ChangeIndexState({required this.index, required this.articlesList});
}
