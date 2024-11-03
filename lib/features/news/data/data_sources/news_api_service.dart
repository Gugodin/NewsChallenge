
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data.dart';
import '../../../../core/const/const.dart';

part 'news_api_service.g.dart';

// Helper utilizado para facilitar y realizar mas entendible el manejo de peticiones a servicios
@RestApi(baseUrl: BASE_URL)
abstract class NewsApiService {

  factory NewsApiService(Dio dio) = _NewsApiService;

  // Servicio GET que se encargará de traer los articulos si no le pasamos ninguna categoria nos regresará articulos generales
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticlesClient({
    @Header('Authorization') required String apiKey,
    @Query('pageSize') required String pageSize,
    @Query('country') required String country,
    @Query('category') String ? category,
  });

}