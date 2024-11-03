import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_challenge/injection_container.dart';
import '../config/config.dart';
import '../features/news/presentation/presentation.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // Widget padre de la aplicación
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      // En este caso utilizamos sl() debido a que la instancia del bloc se coloco en la inicialización de dependencias
      create: (context) => sl()..add(const GetArticles()),
      child:MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        )),
    );
  }
}
