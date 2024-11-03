import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_challenge/core/enums/enums.dart';

import '../presentation.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({super.key});

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ArticleBloc>().add(const LoadMoreArticles());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ultimate News'),
        centerTitle: true,
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticleError) {
            return const Center(
              child: Icon(Icons.error),
            );
          }
          final currentState = state as ArticleSuccess;

          return Column(
            children: [
              Expanded(
                flex: 1,
                child: ToggleButtons(
                  isSelected: List.generate(
                      7,
                      (index) =>
                          NewsCategories.values[index] ==
                          state.currentCategory),
                  onPressed: (int index) {
                    context.read<ArticleBloc>().add(
                        SetCategory(categorie: NewsCategories.values[index]));
                  },
                  children: const <Widget>[
                    Text(
                      'General',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Business',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Entertainment',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Health',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Science',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Sports',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Technology',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 15,
                  child:  currentState.shownArticles!.isEmpty? Center(
                    child: Text('There are not news for this topic.'),
                  ): ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index) => CardArticle(
                      article: currentState.shownArticles![index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: currentState.shownArticles!.length,
                  )),
            ],
          );
        },
      ),
    );
  }
}
