// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

// Modelo que nos serivrá para representar la informacion en la capa de presentación
class ArticleEntity extends Equatable {
  String? source;
  String? title;
  String? description;
  String? date;
  String? urlArticle;
  String? urlImage;

  ArticleEntity({
    this.source,
    this.title,
    this.description,
    this.date,
    this.urlArticle,
    this.urlImage,
  });

  @override
  List<Object?> get props => [
        source,
        title,
        description,
        date,
        urlArticle,
        urlImage,
      ];
}
