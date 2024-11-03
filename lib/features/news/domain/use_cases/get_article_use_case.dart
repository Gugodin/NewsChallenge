// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../core/core.dart';
import '../domain.dart';

// En los casos de uso el TYPE es lo que el caso de uso regresará y PARAMS son los parametros de la función
// Realmente lo que se busca es utilizad un objeto como función para mantener la legibilidad mas clara
class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, String> {
  final ArticleRepository articleRepository;

  GetArticleUseCase({
    required this.articleRepository,
  });

  @override
  Future<DataState<List<ArticleEntity>>> call({String? params}) async {
    return await articleRepository.getArticles(params);
  }
}
