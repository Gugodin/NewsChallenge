part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final NewsCategories? currentCategory;
  final DioException? error;

  const ArticleState({this.articles, this.currentCategory, this.error});

  @override
  List<Object> get props => [articles!, currentCategory!, error!];
}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  const ArticleSuccess(
      List<ArticleEntity> articles, NewsCategories currentCategory);
      
}

class ArticleError extends ArticleState {
  const ArticleError(DioException error);
  
}
