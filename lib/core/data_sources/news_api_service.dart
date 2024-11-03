
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/news/data/data.dart';
import '../const/const.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class NewsApiService {

  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticlesClient({
    @Header('Authorization') required String apiKey,
    @Query('pageSize') required String pageSize,
    @Query('country') required String country,
    @Query('category') String ? category,
  });

}