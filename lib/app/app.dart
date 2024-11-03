import 'package:flutter/material.dart';

import '../config/config.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // Widget padre de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router ,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      )
    );
  }
}