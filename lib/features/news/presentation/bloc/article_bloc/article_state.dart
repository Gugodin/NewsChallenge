part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final List<ArticleEntity>? shownArticles;
  final NewsCategories? currentCategory;
  final DioException? error;

  const ArticleState(
      {this.articles, this.currentCategory, this.shownArticles, this.error});

  @override
  List<Object?> get props => [articles, currentCategory, shownArticles, error];
}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  const ArticleSuccess(
      {required List<ArticleEntity> articles,
      required List<ArticleEntity> shownArticles,
      required NewsCategories currentCategory})
      : super(
            articles: articles,
            currentCategory: currentCategory,
            shownArticles: shownArticles);
}

class ArticleError extends ArticleState {
  const ArticleError({required DioException error}) : super(error: error);
}
