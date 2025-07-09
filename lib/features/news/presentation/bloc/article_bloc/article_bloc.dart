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
  // Aplicación de inyeccion de dependecias
  ArticleBloc({required this.getArticleUseCase}) : super(ArticleLoading()) {
    on<GetArticles>(onGetArticles);
    on<SetCategory>(onSetCategory);
    on<SendError>(onSendError);
    on<LoadMoreArticles>(onLoadMoreArticles);
  }

  // Obtenemos los articulos generales
  Future<void> onGetArticles(
      GetArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    

    final response =
        await getArticleUseCase(params: NewsCategories.general.name);

    if (response is DataSucces) {
      final allArticles = response.data!;
      final firts10Articles = allArticles.sublist(0, 10);
      allArticles.removeRange(0, 10);

      emit(ArticleSuccess(
          articles: allArticles,
          shownArticles: firts10Articles,
          currentCategory: NewsCategories.general));
    } else {
      emit(ArticleError(error: response.error!));
    }
  }

  // Cuando cambiamos de categoría obttenemos los articulos de esa categoría
  Future<void> onSetCategory(
      SetCategory event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    final response = await getArticleUseCase(params: event.categorie.name);

    if (response is DataSucces) {
      print(response.data!.length);
      final allArticles = response.data!;

      // Si hay menos de 10 artículos, ajustamos la cantidad de artículos mostrados
      final first10Articles =
          allArticles.length > 10 ? allArticles.sublist(0, 10) : allArticles;

      // Eliminamos solo si hay más de 10 artículos
      if (allArticles.length > 10) {
        allArticles.removeRange(0, 10);
      } else {
        allArticles.clear(); // Si hay menos de 10, vaciamos la lista de todos
      }

      emit(ArticleSuccess(
          articles: allArticles,
          shownArticles: first10Articles,
          currentCategory: event.categorie));
    } else {
      emit(ArticleError(error: response.error!));
    }
  }

  // Evento que solo nos servirá de prueba si queremos ver que pasa cuando la API nos arroja un error
  Future<void> onSendError(SendError event, Emitter<ArticleState> emit) async {
    emit(ArticleError(error: DioException(requestOptions: RequestOptions())));
  }

  Future<void> onLoadMoreArticles(
      LoadMoreArticles event, Emitter<ArticleState> emit) async {
    final currentState = state as ArticleSuccess;

    await Future.delayed(Duration(seconds: 2));
    // Verifica que haya suficientes artículos para cargar más
    if (currentState.articles!.isEmpty) {
      return; // No hay más artículos para cargar
    }

    final allArticles = List<ArticleEntity>.from(currentState.articles!);
    final currentShownArticles =
        List<ArticleEntity>.from(currentState.shownArticles!);

    // Asegúrate de que solo estás tomando 10 artículos si están disponibles
    final firts10Articles = allArticles.take(10).toList();

    currentShownArticles.addAll(firts10Articles);

    // Remueve los artículos que ya se han mostrado
    allArticles.removeRange(0, firts10Articles.length);

    // Emitir el nuevo estado
    emit(ArticleSuccess(
      articles: allArticles,
      shownArticles: currentShownArticles,
      currentCategory: currentState.currentCategory!,
    ));
  }
}
