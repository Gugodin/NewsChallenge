import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_challenge/features/news/domain/domain.dart';

class CardArticle extends StatelessWidget {
  final ArticleEntity article;

  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          if (article.title! != '[Removed]') {
            context.pushNamed('detailNew', extra: article);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: article.urlImage ?? '',
                            progressIndicatorBuilder:
                                (context, url, progress) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  article.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                DateFormat("dd-MMM-yyyy").format(
                                  DateTime.parse(article.date!),
                                ),
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Center(
                                child: Text(
                                  article.description ??
                                      'No description avalible',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              )),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2, // Altura del borde
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.white.withOpacity(0)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
      ),
      // color: Colors.amber,
    );
  }
}
