import 'package:go_router/go_router.dart';

import '../../features/news/domain/domain.dart';
import '../../features/news/presentation/pages/pages.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeNews(),
    ),
    GoRoute(
      path: '/detailNew',
      name: 'detailNew',
      builder: (context, state) => DetailArticle(
        article: state.extra as ArticleEntity,
      ),
    ),
  ],
);
