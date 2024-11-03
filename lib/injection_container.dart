import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import 'features/news/data/data.dart';
import 'features/news/domain/domain.dart';
import 'features/news/presentation/presentation.dart';

final sl = GetIt.instance;
/* Explicación
  Lo que estamos buscando con el paquete de get_it es tener todas las instanciaciones de nuestra app "globales" 
  y estarán inicializadas incluso antes de que la app se comience a construir

  Podremos guardar estas isntancias de dos patrones distintos "Singleton" y "Factory" lo que diferencian a estos es
  SINGLETON => Solo se crea e instancia una vez y siempre se utilizará la misma instancia
  FACTORY => Cada vez que es utilizado se crea una instancia nueva de este objeto
 */
Future<void> initDependencies()async{

  // Primero registramos DIO porque será utilizado por nuestro helper que hicimos de NewisApiService
  sl.registerSingleton<Dio>(Dio()); 
  // Luego registramos el helper
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  // En este caso registramos el repositorio de nuestras noticias PERO no con la misma clase si no con la implementación y la implementación esta
  // Haciendo uso del registro previo "NewsApiService"
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(newsApiService: sl()));
  // Ahora registramos los casos de uso que serán utilizados por los blocs y estons mismos esta utilizando el previo registro "ArticleRepository"
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(articleRepository: sl()));

  // Por ultimo registramos los blocs pero estos no se pueden registrar como singleton
  // Debido a que cada cambio del mismo bloc regresa una instancia de este distinta
  sl.registerFactory<ArticleBloc>(()=> ArticleBloc(getArticleUseCase: sl()));
}