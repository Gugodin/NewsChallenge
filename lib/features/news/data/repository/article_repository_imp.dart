

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ArticleRepositoryImp implements ArticleRepository {
  @override
  // Ojo aquí utilizamos "ArticleModel" en vez de "ArticleEntity" debido a que "ArticleModel" solo se debe de usar en la capa de DATA
  // y "ArticleEntity" solo se debe de usar en la capa de DOMINIO y PRESENTATION según la CLEAN arquitecture
  
  Future<DataState<List<ArticleModel>>> getArticles(String? categorie) {
    
    throw UnimplementedError();
  }
}
