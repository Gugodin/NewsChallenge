// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ArticleRepositoryImp implements ArticleRepository {
  // Obtenemos el helper para poder realizar peticiones http
  NewsApiService newsApiService;
  // Aplicación de inyeccion de dependecias
  ArticleRepositoryImp({
    required this.newsApiService,
  });

  @override
  // Ojo aquí utilizamos "ArticleModel" en vez de "ArticleEntity" debido a que "ArticleModel" solo se debe de usar en la capa de DATA
  // y "ArticleEntity" solo se debe de usar en la capa de DOMINIO y PRESENTATION según la CLEAN arquitecture
  Future<DataState<List<ArticleModel>>> getArticles(String? categorie) async {
    // Lo metemos en un try por si en algun caso la aplicación llega a fallar en algo interno
    try {
      //  Realizamos la pateición con el helper
      final httpResponse = await newsApiService.getArticlesClient(
          apiKey: API_KEY, pageSize: AMOUNT_ARTICLES, country: CONTRY_NEWS);
      // Si sale todo bien regresamos el tipo de dato success con la data dentro
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucces(httpResponse.data);
      } else {
      // Si no regresamos el tipo de data error con la informacion del error
        return DataError(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      // Si pasa algo inesperado regresamos el error
      return DataError(e);
    }
  }
}
