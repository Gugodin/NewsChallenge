import 'package:flutter/material.dart';
import 'package:news_challenge/app/app.dart';
import 'package:news_challenge/injection_container.dart';

// Clase solamente para definir la funcion main de la aplicación
Future<void> main() async {
  await initDependencies();
  runApp(const NewsApp());
}


