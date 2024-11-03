// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: must_be_immutable

import '../../domain/domain.dart';

// Modelo que extiende de nuestra entidad debido a que contienen los mismos parametros
// Lo unico que lo diferencia es el metodo fromJson que será utilizado por el helper de RETROFIT
class ArticleModel extends ArticleEntity {
  ArticleModel({
    super.source,
    super.title,
    super.description,
    super.date,
    super.urlArticle,
    super.urlImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      source: map['source']['name'] != null
          ? map['source']['name'] as String
          : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      date: map['publishedAt'] != null ? map['publishedAt'] as String : null,
      urlArticle: map['url'] != null ? map['url'] as String : null,
      urlImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
    );
  }
}
