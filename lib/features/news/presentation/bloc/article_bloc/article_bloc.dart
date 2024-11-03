// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_challenge/features/news/domain/domain.dart';
import 'package:news_challenge/features/news/domain/use_cases/get_article_use_case.dart';

import '../../../../../core/core.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  final GetArticleUseCase getArticleUseCase;

  ArticleBloc({required this.getArticleUseCase}) : super(ArticleLoading()) {
    on<GetArticles>(onGetArticles);
    on<SetCategory>(onSetCategory);
    on<SendError>(onSendError);
  }

  // Obtenemos los articulos generales
  Future<void> onGetArticles(GetArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    final response = await getArticleUseCase(params: NewsCategories.general.name);

    if(response is DataSucces){
      emit(ArticleSuccess(response.data!,NewsCategories.general));
    }else{
      emit(ArticleError(response.error!));
    }


  }

  // Cuando cambiamos de categoría obttenemos los articulos de esa categoría
  Future<void> onSetCategory(SetCategory event, Emitter<ArticleState> emit)async {
    emit(ArticleLoading());

    final response = await getArticleUseCase(params: event.categorie.name);

    if(response is DataSucces){
      emit(ArticleSuccess(response.data!,event.categorie));
    }else{
      emit(ArticleError(response.error!));
    }
  }

  // Evento que solo nos servirá de prueba si queremos ver que pasa cuando la API nos arroja un error
  Future<void> onSendError(SendError event, Emitter<ArticleState> emit) async{
    emit(ArticleError(DioException(requestOptions: RequestOptions())));
  }
}
