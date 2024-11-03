import '../../../../core/core.dart';
import '../entities/entities.dart';

// En este repositorio solo declaramos las funciones de nuestra logica de negocio que luego será implementada por los casos de uso
abstract class ArticleRepository {
  // Obtendrá las ultimas 100 noticias (Es el limite de la API)
  /* Explicación, obtendremos las 100 noticias y estaremos mostrandolas de 10 en 10 debido a que al hacer pruebas
  con postman con la API al momento de pedir 2 veces 10 noticias para poder simular un nuevo cargado de datos, estas 10 noticias siempre
  son las mismas, entonces lo que se  realizará primero cargaremos 100 noticias y las mostraremos de 100 en 100 */
  Future<DataState<List<ArticleEntity>>> getArticles(String? categorie);
}
