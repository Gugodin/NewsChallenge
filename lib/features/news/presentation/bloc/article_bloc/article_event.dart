// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'article_bloc.dart';

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

// Evento para obtener los articulos recientes
class GetArticles extends ArticleEvent {
  const GetArticles();
  @override
  List<Object> get props => [];
}

// Evento cuando se seleccione un filtro distinto
class SetCategory extends ArticleEvent {
  NewsCategories categorie;

  SetCategory({
    required this.categorie,
  });
  @override
  List<Object> get props => [categorie];
}

// Evento para poder probar cuando la aplicación reciba un error
class SendError extends ArticleEvent {
  const SendError();

  @override
  List<Object> get props => [];
}
